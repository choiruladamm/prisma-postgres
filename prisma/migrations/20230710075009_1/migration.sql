-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "fname" TEXT NOT NULL,
    "lname" TEXT NOT NULL,
    "friendId" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Car" (
    "id" TEXT NOT NULL,
    "color" TEXT NOT NULL,
    "bought" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Car_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CarBlog" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "CarBlog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CategoryCarBlogs" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CategoryCarBlogs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CarBlogToCategoryCarBlogs" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_friendId_key" ON "User"("friendId");

-- CreateIndex
CREATE UNIQUE INDEX "Car_userId_key" ON "Car"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_CarBlogToCategoryCarBlogs_AB_unique" ON "_CarBlogToCategoryCarBlogs"("A", "B");

-- CreateIndex
CREATE INDEX "_CarBlogToCategoryCarBlogs_B_index" ON "_CarBlogToCategoryCarBlogs"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_friendId_fkey" FOREIGN KEY ("friendId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Car" ADD CONSTRAINT "Car_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarBlog" ADD CONSTRAINT "CarBlog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CarBlogToCategoryCarBlogs" ADD CONSTRAINT "_CarBlogToCategoryCarBlogs_A_fkey" FOREIGN KEY ("A") REFERENCES "CarBlog"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CarBlogToCategoryCarBlogs" ADD CONSTRAINT "_CarBlogToCategoryCarBlogs_B_fkey" FOREIGN KEY ("B") REFERENCES "CategoryCarBlogs"("id") ON DELETE CASCADE ON UPDATE CASCADE;
