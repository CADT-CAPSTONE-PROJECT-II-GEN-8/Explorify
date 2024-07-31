// import React, { useEffect, useState } from 'react';
// import axios from 'axios';

import Header from "../CompanyPost/Header";
import { FaBuilding, FaIndustry, FaLink, FaTasks } from "react-icons/fa";
import { Link } from "react-router-dom";
import axiosInstance from "src/utils/axiosInstance";
import { useState, useEffect } from "react";
const Profile = () => {
  // const { companyId } = useParams();
  const [companyData, setCompanyData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchCompanyData = async () => {
      try {
        const response = await axiosInstance.get(`account/company-profile/`);
        setCompanyData(response.data.body);
        console.log(response.data);
      } catch (error) {
        setError(error.message);
      }
    };

    fetchCompanyData();
  }, []);

  if (error) {
    return <div className="text-red-500 text-center mt-4">Error: {error}</div>;
  }

  if (!companyData) {
    return <div className="text-center mt-4">Loading...</div>;
  }

  return (
    <>
      <Header />

      <section className="text-blueGray-700 bg-white mt-10">
        <div className="container flex flex-col items-center px-5 py-16 mx-auto md:flex-row lg:px-28">
          <div className="flex flex-col items-start mb-16 text-left lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 md:mb-0">
            <h2 className="mb-8 text-xs font-semibold tracking-widest text-black uppercase title-font">
              {" "}
              IT Solution{" "}
            </h2>
            <h1 className="mb-8 text-xl font-black tracking-tighter text-black md:text-3xl title-font">
              {" "}
              IT Solution{" "}
            </h1>
            <p className="mb-8 text-base leading-relaxed text-left text-blueGray-600 ">
              {" "}
              Lorem Ipsum is simply dummy text of the printing and typesetting
              industry. Lorem Ipsum has been the industry's standard dummy text
              ever since the 1500s, when an unknown printer took a galley of
              type and scrambled it to make a type specimen book. It has
              survived not only five centuries, but also the leap into
              electronic typesetting, remaining essentially unchanged. It was
              popularised in the 1960s with the release of Letraset sheets
              containing Lorem Ipsum passages, and more recently with desktop
              publishing software like Aldus PageMaker including versions of
              Lorem Ipsum.{" "}
            </p>
            <div className="flex flex-col justify-center lg:flex-row">
              <Link to="/">
                <button
                  type="button"
                  class="text-white bg-amber-500  inline-flex items-center hover:text-white border  hover:bg-amber-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900"
                >
                  Back to home
                </button>
              </Link>
            </div>
          </div>

            {companyData.company_pic && (
              <div className="mb-8">
                 <img src={`http://localhost:8989/${companyData.company_pic}`}  alt="Company Logo" className="object-cover object-center rounded-lg" />
              </div>
            )}
        
        </div>

        <article className="font-fira mx-auto max-w-3xl  selection:bg-black selection:text-white">
          <h1 class="pb-5 lg:text-2xl text-2xl md:text-xl font-bold tracking-tight text-gray-900 text-center">
            Additionally
            <span class="pl-2 text-transparent bg-clip-text bg-gradient-to-r from-amber-600 via-amber-700 to-gray-600">
              About Company
            </span>
          </h1>
          <div class="pt-10 container mx-auto max-w-5xl grid gap-12 grid-cols-1 md:grid-cols-3 items-start justify-center">
            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <FaBuilding
                  className="h-6 w-6 text-[#F27C1C]"
                  aria-label="Company Icon"
                />
              </div>
              <h3 class="text-md font-bold">
                Head Office
                <br />
                <span className="font-normal text-center"> HEoo </span>
              </h3>
            </div>

            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <FaIndustry
                  className="h-6 w-6 text-[#F27C1C]"
                  aria-label="Industry Icon"
                />
              </div>
              <h3 class="text-md font-bold">
                Industry
                <br />
                <span className="font-normal text-center">Hello </span>
              </h3>
            </div>

            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <FaTasks
                  className="h-6 w-6 text-[#F27C1C]"
                  aria-label="Specialization Icon"
                />
              </div>
              <h3 class="text-md font-bold">
                Spectailization
                <br />
                <span className="font-normal text-center">Hello </span>
              </h3>
            </div>

            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"
                  ></path>
                </svg>
              </div>
              <h3 class="text-md font-bold">
                Company size
                <br />
                <span className="font-normal text-center">
                  Our company have Hello staff
                </span>
              </h3>
            </div>

            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <FaLink
                  className="h-6 w-6 text-[#F27C1C]"
                  aria-label="Website Icon"
                />
              </div>
              <h3 class="text-md font-bold">
                Website
                <br />
                <span className="font-normal text-center pt-2 text-blue-500 hover:underline">
                  Hello{" "}
                </span>
              </h3>
            </div>
          </div>

          <section className="mt-16">
            <h1 class="pb-5 lg:text-2xl text-2xl md:text-xl font-bold tracking-tight text-gray-900 text-center">
              Our company location
            </h1>
            <div>
              <p className="mt-6 text-lg dark:text-neutral-200">
                Address: Hello
              </p>
              <iframe
                src={`https://www.google.com/maps/embed?pb=${encodeURIComponent}`}
                className="rounded-lg w-full h-64 pt-5"
                style={{ border: 0 }}
                allowFullScreen
                loading="lazy"
                referrerPolicy="no-referrer-when-downgrade"
                title="Company Location"
              />
            </div>
          </section>
        </article>
      </section>
    </>
  );
};

export default Profile;
