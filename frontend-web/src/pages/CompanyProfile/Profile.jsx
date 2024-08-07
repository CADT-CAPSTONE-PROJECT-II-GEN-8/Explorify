// import React, { useEffect, useState } from 'react';
// import axios from 'axios';

import { useEffect, useState } from "react";
import { Helmet } from "react-helmet";
import { FaBuilding, FaGlobe, FaIndustry, FaTasks, FaUser } from "react-icons/fa";
import { Link } from "react-router-dom";
import Spinner from "src/components/SmallComponents/Spinner";
import axiosInstance from "src/utils/axiosInstance";
import Header from "../CompanyPost/Header";
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
    return <Spinner />
  }

  return (
    <>
      <Helmet>
        <title>Profile - Explorify</title>
      </Helmet>
      <Header />

      <section className="text-blueGray-700 bg-white mt-10">
        <div className="container flex flex-col items-center px-5 py-16 mx-auto md:flex-row lg:px-28">
          <div className="flex flex-col items-start mb-16 text-left lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 md:mb-0">
            <h2 className="mb-8 text-xs font-semibold tracking-widest text-black uppercase title-font">
              Company Name
            </h2>
            <h1 className="mb-8 text-xl font-black tracking-tighter text-black md:text-3xl title-font">
              {companyData.company_name}
            </h1>
            <p className="mb-8 text-base leading-relaxed text-left text-blueGray-600 ">
              {companyData.description}
            </p>
            <div className="flex flex-col justify-center lg:flex-row">
              <Link to="/edit/company/profile">
                <button
                  type="button"
                  class="text-white  bg-[#F27C1C] hover:bg-[#ce6918]   inline-flex items-center hover:text-white border  focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900"
                >
                  Update Profile
                </button>
              </Link>
            </div>
          </div>

          {companyData.company_pic && (
            <div className="mb-8">
              <img src={`http://localhost:8989/${companyData.company_pic}`} alt="Company Logo" className="object-cover object-center rounded-lg" />
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
                <span className="font-normal text-center">{companyData.head_office}</span>
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
                <span className="font-normal text-center">{companyData.company_type}</span>
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
                <span className="font-normal text-center">{companyData.specialization}</span>
              </h3>
            </div>

            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <FaUser
                  className="h-6 w-6 text-[#F27C1C]"
                />
              </div>
              <h3 class="text-md font-bold">
                Company size
                <br />
                <span className="font-normal text-center">
                  Our company has {companyData.employee_size} staff
                </span>
              </h3>
            </div>

            <div class="grid gap-6 justify-items-center text-center">
              <div class="rounded-full border-8 border-amber-400 p-4">
                <FaGlobe
                  className="h-6 w-6 text-[#F27C1C]"
                  aria-label="Website Icon"
                />
              </div>
              <h3 class="text-md font-bold">
                Website
                <br />
                <span className="font-normal text-center pt-2 text-blue-500 hover:underline">
                  {companyData.company_website}
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
                Address: {companyData.location}
              </p>
              <a href="https://www.google.com.kh/maps/place/Cambodia+Academy+of+Digital+Technology+(CADT)/@11.6459053,104.9051856,14z/data=!4m6!3m5!1s0x3109516bdea989b3:0x372d2c5e0e14b706!8m2!3d11.6530599!4d104.9116944!16s%2Fg%2F11byygmxw3?entry=ttu">
                <iframe
                  src={`https://www.google.com/maps/embed?pb=${encodeURIComponent}`}
                  className="rounded-lg w-full h-64 pt-5"
                  style={{ border: 0 }}
                  allowFullScreen
                  loading="lazy"
                  referrerPolicy="no-referrer-when-downgrade"
                  title="Company Location"
                />
              </a>
            </div>
          </section>
        </article>
      </section>
    </>
  );
};

export default Profile;
