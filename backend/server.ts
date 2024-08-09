
import express from 'express';
import { Pool } from 'pg';

const app = express();
const port = 3000;
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'stocks',
  password: 'password',
  port: 5432,
});

app.get('/stocks', async (req, res) => {
  const result = await pool.query('SELECT name, current_price FROM stock_data;');
  res.json(result.rows);
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
