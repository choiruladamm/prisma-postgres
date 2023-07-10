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
        lname: userData.lname
      },
    });

    return res.json({ user: user });
  },
};
