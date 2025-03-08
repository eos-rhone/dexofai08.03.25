module.exports = {
  apps: [
    {
      name: "dexofai-cron",
      script: "./scripts/runCron.ts",
      interpreter: "node",
      interpreter_args: "-r tsx",
      watch: false,
      env: {
        NODE_ENV: "production",
      },
      autorestart: true,
      max_memory_restart: "1G",
      cron_restart: "0 3 * * *"
    },
    {
      name: 'stats-updater',
      script: './scripts/update_tool_stats.ts',
      exec_interpreter: 'ts-node',
      cron_restart: '0 0 * * *', // Exécuter tous les jours à minuit
      watch: false,
      env: {
        NODE_ENV: 'production',
        SIMILARWEB_API_KEY: process.env.SIMILARWEB_API_KEY
      }
    }
  ]
};
