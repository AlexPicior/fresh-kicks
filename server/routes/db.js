const Pool = require('pg').Pool;

const pool = new Pool({
    connectionString : "postgres://eouhmjmgvdmdqy:03dc321e283fd12463b0f473eb510762ef33e62e8ffdddf383fe30bf01d8050a@ec2-52-209-225-31.eu-west-1.compute.amazonaws.com:5432/d6ruo347aeufb6",
    ssl: {
        rejectUnauthorized: false, 
    }, 
    },
);

pool.on("error", (err)=>{
  console.error('PostgreSQL client error:', err);
});

module.exports = pool;