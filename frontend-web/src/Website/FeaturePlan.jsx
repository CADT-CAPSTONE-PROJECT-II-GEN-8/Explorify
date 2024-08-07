import React from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';
import { FreeMium, Premium } from './ImageSrc';
import { motion } from 'framer-motion';

export const FreemiumPremium = () => {
  return (
    <div className="lg:px-20 md:p-20 bg-white ">
      
      <div className="flex flex-col md:flex-row justify-between items-center mb-12 ">
        {/* Left side graphic */}
        <motion.div
          className="flex-1 flex justify-center mb-8 md:mb-0"
          initial={{ opacity: 0, y:20 }}
          whileInView={{ opacity: 1, y:0}}
          transition={{ duration: 0.5 }}
          viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
        >
          <img
            src={FreeMium}
            alt="Illustration"
            className="w-full max-w-xs"
          />
        </motion.div>

        {/* Right side content for Freemium */}
        <motion.div
          className="flex-1 p-5 text-gray-800"
          initial={{ opacity: 0, y:20}}
          whileInView={{ opacity: 1, y:0}}
          transition={{ duration: 0.5 }}
          viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
        >
          <h2 className="font-bold text-3xl mb-5">FREEMIUM</h2>
          <p className="mt-5 mb-5 text-lg text-gray-600">
            Explore the essential tools of our application with the FreeMium plan. Designed to give you access to the most crucial features, the free version allows you to:
          </p>
          <ul className="list-none p-0 mb-5">
            <li className="mb-3">
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              View Job Listing
            </li>
            <li className="mb-3">
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              View Article List
            </li>
            <li>
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              Generate CV
            </li>
          </ul>
        </motion.div> 
      </div>

      <div className="flex flex-col-reverse md:flex-row justify-between items-center">
        {/* Left side content for Premium */}
        <motion.div
          className="flex-1 p-5 text-gray-800"
          initial={{ opacity: 0, y:20 }}
           whileInView={{ opacity: 1, y:0}}
          transition={{ duration: 0.5 }}
          viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
        >
          <h2 className="font-bold text-3xl mb-5">PREMIUM</h2>
          <p className="mt-5 mb-5 text-lg text-gray-600">
            Unlock the full potential of our application with the Premium plan. Enjoy advanced tools and personalized features designed to enhance your experience:
          </p>
          <ul className="list-none p-0 mb-5">
            <li className="mb-3">
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              View Job Listing
            </li>
            <li className="mb-3">
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              View Article List
            </li>
            <li className="mb-3">
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              Generate CV
            </li>
            <li className="mb-3">
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              Choose CV Template
            </li>
            <li>
              <FontAwesomeIcon icon={faCheckCircle} className="mr-2 text-[#F27C1C]" />
              Recommended Course
            </li>
          </ul>
        </motion.div>

        {/* Right side graphic */}
        <motion.div
          className="flex-1 flex justify-center mb-8 md:mb-0"
          initial={{ opacity: 0, y:20}}
          whileInView={{ opacity: 1, y:0}}
          transition={{ duration: 0.5 }}
          viewport={{ once: false, amount: 0.5 }} // Trigger every time it's in view
        >
          <img
            src={Premium}
            alt="Premium Illustration"
            className="w-full max-w-xs"
          />
        </motion.div>
      </div>
    </div>
  );
};
