import * as express from 'express';

const app = express();
const port = process.env.PORT || 8080;

app.listen(port, () => console.log(`Server running on ${port}!`));

app.get('/:value', (req, res) => {
  console.log(`${req.method}: ${req.url}`);
  const str = req.params.value as string;
  res.send({ message: `Hello ${str}!` });
});
