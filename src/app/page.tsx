export default function Home() {
  return (
    <main className="max-w-[1200px] mx-auto px-4 py-8">
      <div className="grid grid-cols-1 md:grid-cols-[200px_1fr_250px] gap-8">
        {/* Left Menu */}
        <nav className="hidden md:block border-r border-gray-800 pr-4">
          <ul className="space-y-4 mono text-sm">
            <li className="text-accent cursor-pointer hover:underline">Home</li>
            <li className="cursor-pointer hover:underline">Explore</li>
            <li className="cursor-pointer hover:underline">Blogs</li>
            <li className="cursor-pointer hover:underline">Questions</li>
          </ul>
        </nav>

        {/* Main Content Area (720-760px) */}
        <article className="max-w-[760px]">
          <h1 className="text-4xl font-bold mb-6 text-parchment">
            Welcome to the Knowledge Base
          </h1>
          <p className="mb-4">
            This platform is dedicated to providing deep, structured, and satisfying answers to complex, real-world questions. We prioritize reading comfort, calmness, and clarity above all else.
          </p>
          <div className="p-6 my-8 border border-gray-800 rounded-lg">
            <h2 className="text-2xl mb-2 text-accent">What is this space?</h2>
            <p>
              It's an editorial, human-written platform. No AI fluff, no infinite scrolling social feeds. Just answers.
            </p>
          </div>
        </article>

        {/* Right Sidebar */}
        <aside className="hidden md:block opacity-60 hover:opacity-100 transition-opacity">
          <h3 className="mono text-xs uppercase tracking-widest mb-4">Suggested</h3>
          <ul className="space-y-4 text-sm">
            <li className="cursor-pointer hover:text-accent">Dwell Time vs Bounce Rate</li>
            <li className="cursor-pointer hover:text-accent">The Core Web Vitals Update</li>
          </ul>
        </aside>
      </div>
    </main>
  );
}
