import Image from "next/image";

export default function Home() {
  return (
    <div className="font-sans grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20">
      <main className="flex flex-col gap-[32px] row-start-2 items-center sm:items-start">
        <Image
          className="dark:invert"
          src="/next.svg"
          alt="Next.js logo"
          width={180}
          height={38}
          priority
        />
        <div className="text-center">
          <h1 className="text-2xl font-bold mb-4">Tiny CRM Frontend</h1>
          <p className="text-gray-600">Ready to connect to Rails API at localhost:3000/api/v1</p>
        </div>
      </main>
    </div>
  );
}