import { Router } from "express";
import { userController } from "../controllers/user.controller";

const routes = Router();

routes.get("/", userController.index);
routes.post("/create", userController.createUser);
routes.get("/:id", userController.findUniqueUser);
routes.delete("/:id", userController.deleteUser);
routes.patch("/:id", userController.updateUser)

export default routes;
