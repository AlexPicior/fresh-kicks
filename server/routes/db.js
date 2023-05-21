const Pool = require('pg').Pool;

const pool = new Pool({
    connectionString : "postgres://default:7uymOrxfa6vK@ep-mute-wind-038381-pooler.eu-central-1.postgres.vercel-storage.com:5432/verceldb",
    ssl: {
        rejectUnauthorized: false, 
      },
    }
);

module.exports = pool;