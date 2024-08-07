import React from "react";
import { About } from "./ImageSrc";
import { motion } from 'framer-motion';

export const AboutUsPage = () => {
  return (
    <div className="flex flex-col md:flex-row items-center p-8 md:p-12 bg-white">
      {/* Left side graphic */}
      <motion.div
        initial={{ opacity: 0, y: 50 }}
        whileInView={{ opacity: 1, y: 0 }}
        transition={{ duration: 1 }}
        viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
        className="flex-1 flex justify-center items-center mb-8 md:mb-0"
      >
        <img
          src={About}
          alt="Illustration"
          className="w-full max-w-xs"
        />
      </motion.div>

      {/* Right side content */}
      <motion.div
        initial={{ opacity: 0, y: 50 }}
        whileInView={{ opacity: 1, y: 0 }}
        transition={{ duration: 1 }}
        viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
        className="flex-1 p-5 text-gray-800 md:mr-20"
      >
        <h2 className="font-bold text-2xl md:text-3xl mb-5">ABOUT US</h2>
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
      </motion.div>
    </div>
  );
};
