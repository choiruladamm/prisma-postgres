import { Request, Response } from "express";
import prisma from "../services/prisma";

export const userController = {
  // get all data users
  async index(req: Request, res: Response) {
    const users = await prisma.user.findMany();

    return res.json(users);
  },

  // create user
  async createUser(req: Request, res: Response) {
    const userData = req.body;
    const user = await prisma.user.create({
      data: {
        fname: userData.fname,
        lname: userData.lname,
      },
      include: {
        car: true,
      },
    });

    return res.json({ user: user });
  },

  // find one user
  async findUniqueUser(req: Request, res: Response) {
    const { id } = req.params;
    const user = await prisma.user.findUnique({
      where: {
        id: String(id),
      },
    });

    return res.json({ user: user });
  },

  // delete user
  async deleteUser(req: Request, res: Response) {
    const { id } = req.params;
    const user = await prisma.user.delete({
      where: {
        id: String(id),
      },
    });

    return res.json({ user: user, message: "delete user succesfully" });
  },

  // update user
  async updateUser(req: Request, res: Response) {
    const { id } = req.params;
    const userData = req.body;

    const user = await prisma.user.update({
      where: {
        id: String(id),
      },
      data: {
        fname: userData.fname,
        lname: userData.lname,
      },
    });

    return res.json({ user: user, message: "update user succesfully" });
  },
};
