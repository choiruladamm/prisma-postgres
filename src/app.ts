import express, { Router } from "express";

class App {
  public server;

  constructor() {
    this.server = express();

    this.middlewares();
    this.routes();
  }
  middlewares() {
    this.server.use(express.json());
  }

  routes() {
    this.server.use();
  }
}

export default new App().server;
