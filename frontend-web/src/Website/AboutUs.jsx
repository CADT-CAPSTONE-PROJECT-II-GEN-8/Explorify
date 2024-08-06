import React from "react";
import { About } from "./ImageSrc";

export const AboutUsPage = () => {
  return (
    <div className="flex items-center p-12 bg-white">

      {/* Left side graphic */}
      <div className="flex-1 flex justify-center items-center">
        <img
          src={About}
          alt="Illustration"
          className="w-full max-w-xs"
        />
      </div>
      

      {/* Right side content */}
      <div className="flex-1 p-5 text-gray-800 mr-20">
        <h2 className="font-bold text-3xl mb-5">ABOUT US</h2>
        <h3 className="text-lg font-medium text-gray-700">
          Welcome to <span className="text-orange-400">Explorify</span>, a platform dedicated to helping students find their dream internships.
        </h3>
        <p className="mt-2 text-base text-gray-500 mb-5">
          Our mission is to empower students by providing them with the tools and resources they need to seamlessly navigate their internship search and career development.
        </p>
        <button
          className="py-2 px-4 bg-[#F27C1C] text-white rounded-lg cursor-pointer text-base"
        >
          Read More
        </button>
      </div>
    </div>
  );
};
