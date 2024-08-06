import React , { useState, useEffect } from 'react';
import { FaFilePdf, FaRegFilePdf } from 'react-icons/fa';
import { FaFileCircleCheck, FaFileCircleExclamation } from 'react-icons/fa6';
import CountAccept from 'src/pages/Email/CountAccept';
import CountReject from 'src/pages/Email/CountReject';

import axiosInstance from 'src/utils/axiosInstance';


const Navbar = () => {
  const [activePostCount, setActivePostCount] = useState(0);
  const [applicationCount, setApplicationCount] = useState(0);

  useEffect(() => {
    const fetchCounts = async () => {
      try {
        const [activePostResponse, applicationResponse] = await Promise.all([
          axiosInstance.get('internship/count/'),
          axiosInstance.get('internship/application/count/')
        ]);

        setActivePostCount(activePostResponse.data.active_post_count);
        setApplicationCount(applicationResponse.data.application_count);
      } catch (error) {
        console.error("Error fetching counts", error);
      }
    };

    fetchCounts();
  }, []);
  return (
    <>
      <div className=" flex flex-col lg:flex-row w-full lg:space-x-4 space-y-6 lg:space-y-0 mb-2 lg:mb-4">
        <div className="w-full lg:w-1/4">
          <div className="widget w-full p-8 rounded-lg shadow-md bg-white border border-gray-100 ">
            <div className="flex flex-row items-center justify-between">
              <div className="flex items-center justify-center flex-shrink-0 h-12 w-12 rounded-xl bg-[#fce0c9] text-[#F27C1C]">
                <svg
                  className="w-6 h-6"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                  />
                </svg>
              </div>
              <div className="flex flex-col">
                <div className="text-xl font-bold">{activePostCount ?? 23}</div>
                <div className="text-xs uppercase font-light text-gray-800">
                  Posted job
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="w-full lg:w-1/4">
          <div className="widget w-full p-8 rounded-lg shadow-md bg-white border border-gray-100 ">
            <div className="flex flex-row items-center justify-between">
              <div className="flex items-center justify-center flex-shrink-0 h-12 w-12 rounded-xl bg-[#fce0c9] text-[#F27C1C]">
                <FaRegFilePdf  className='w-6 h-6 '/>
              </div>
              <div className="flex flex-col">
                <div className="text-xl font-bold">{applicationCount ?? 23}</div>
                <div className="text-xs uppercase font-light text-gray-500">
                  Application
                </div>
              </div>
            </div>
          </div>
        </div>


        <div className="w-full lg:w-1/4">
          <div className="widget w-full p-8 rounded-lg shadow-md bg-white border border-gray-100 ">
            <div className="flex flex-row items-center justify-between">
              <div className="flex items-center justify-center flex-shrink-0 h-12 w-12 rounded-xl bg-[#fce0c9] text-[#F27C1C]">
                <FaFileCircleCheck className="w-6 h-6"/>
              </div>
              <div className="flex flex-col">
                <div className="text-xl font-bold"><CountAccept/></div>
                <div className="text-xs uppercase font-light text-gray-500">
                  Approval
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="w-full lg:w-1/4">
          <div className="widget w-full p-8 rounded-lg shadow-md bg-white border border-gray-100 ">
            <div className="flex flex-row items-center justify-between">
              <div className="flex items-center justify-center flex-shrink-0 h-12 w-12 rounded-xl bg-[#fce0c9] text-[#F27C1C]">
               <FaFileCircleExclamation className='w-6 h-6'/>
              </div>
              <div className="flex flex-col">
                <div className="text-xl font-bold"><CountReject/></div>
                <div className="text-xs uppercase font-light text-gray-500">
                 Rejection
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Navbar;
