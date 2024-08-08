import React from "react";
import { motion } from "framer-motion";

export const Offer = () => {
  return (
    <div className="flex flex-col md:flex-row items-center p-6 md:p-12 bg-white">
      {/* Left side graphic */}
      <motion.div
        className="flex-1 flex justify-center items-center mb-6 md:mb-0"
        initial={{ opacity: 0, y:20 }}
        whileInView={{ opacity: 1, y:0}}
        transition={{ duration: 0.5 }}
        viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
      >
        <img
          src="https://thecapacitycollective.org/wp-content/uploads/2024/05/Apricot-Preparation-2.png"
          alt="Illustration"
          className="w-full max-w-xs md:max-w-md"
        />
      </motion.div>

      {/* Right side content */}
      <motion.div
        className="flex-1 p-5 text-gray-800"
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y:0}}
        transition={{ duration: 0.5 }}
        viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
      >
        <h2 className="font-bold text-2xl md:text-3xl mb-4 md:mb-5">WHAT DO WE OFFER?</h2>
        <div className="mt-4 mb-8 md:mb-10">
          <p className="text-base md:text-lg text-gray-600 lg:pr-16">
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
      </motion.div>
    </div>
  );
};
