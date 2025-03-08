import axios from 'axios';
import { ScrapedTool, ValidationResult } from '../types';

export async function validateTool(tool: ScrapedTool): Promise<ValidationResult> {
    const result: ValidationResult = {
        isValid: true,
        errors: [],
        warnings: []
    };
    
    // Vérifier les données obligatoires
    if (!tool.name || tool.name.length < 2) {
        result.errors.push('Nom invalide ou trop court');
        result.isValid = false;
    }
    
    if (!tool.description || tool.description.length < 10) {
        result.errors.push('Description trop courte ou manquante');
        result.isValid = false;
    }
    
    // Vérifier l'URL
    if (!tool.website_url) {
        result.errors.push('URL manquante');
        result.isValid = false;
    } else {
        try {
            const response = await axios.head(tool.website_url, {
                timeout: 5000,
                maxRedirects: 5
            });
            
            if (response.status >= 400) {
                result.errors.push(`URL invalide (status ${response.status}): ${tool.website_url}`);
                result.isValid = false;
            }
        } catch (error) {
            result.errors.push(`URL inaccessible: ${tool.website_url}`);
            result.isValid = false;
        }
    }
    
    // Vérifier les catégories
    if (!tool.categories || tool.categories.length === 0) {
        result.warnings.push('Aucune catégorie spécifiée');
    }
    
    // Vérifier le prix
    if (!tool.pricing || tool.pricing.length === 0) {
        result.warnings.push('Information de prix manquante');
    }
    
    // Vérifier l'image
    if (tool.image_url) {
        try {
            const response = await axios.head(tool.image_url, {
                timeout: 5000
            });
            
            if (response.status >= 400) {
                result.warnings.push(`Image inaccessible: ${tool.image_url}`);
            }
        } catch (error) {
            result.warnings.push(`Image inaccessible: ${tool.image_url}`);
        }
    }
    
    return result;
}

export async function checkForDuplicates(tool: ScrapedTool, existingTools: ScrapedTool[]): Promise<boolean> {
    // Vérifier les doublons par nom
    const nameMatch = existingTools.find(
        t => t.name.toLowerCase() === tool.name.toLowerCase()
    );
    if (nameMatch) return true;
    
    // Vérifier les doublons par URL
    const urlMatch = existingTools.find(
        t => t.website_url.toLowerCase() === tool.website_url.toLowerCase()
    );
    if (urlMatch) return true;
    
    return false;
}
