import { Request, Response } from "express"
import prisma from "../services/prisma"

export const userController = {
  async index(req: Request, res: Response) {
    const users = await prisma.user.findMany()

    return res.json(users)
  }
}