import React from "react";

export const Offer = () => {
  return (
    <div className="flex flex-col md:flex-row items-center p-6 md:p-12 bg-white">
      {/* Left side graphic */}
      <div className="flex-1 flex justify-center items-center mb-6 md:mb-0">
        <img
          src="https://thecapacitycollective.org/wp-content/uploads/2024/05/Apricot-Preparation-2.png"
          alt="Illustration"
          className="w-full max-w-xs md:max-w-md"
        />
      </div>

      {/* Right side content */}
      <div className="flex-1 p-5 text-gray-800">
        <h2 className="font-bold text-2xl md:text-3xl mb-4 md:mb-5">WHAT DO WE OFFER?</h2>
        <div className="mt-4 mb-8 md:mb-10">
          <p className="text-base md:text-lg text-gray-600">
            At <span className="text-orange-400">Explorify</span>, we simplify your internship search by
            offering a personalized experience tailored to your unique career path. Our platform connects you with
            relevant opportunities, provides tools to manage your applications, and helps you network with professionals
            in your desired industry. Whether you’re a student or recent graduate, Explorify is here to make your
            internship journey smoother and more successful.
          </p>
        </div>
        <button
          className="py-2 px-4 bg-[#F27C1C] text-white rounded-lg cursor-pointer text-base"
        >
          Download Now
        </button>
      </div>
    </div>
  );
};
