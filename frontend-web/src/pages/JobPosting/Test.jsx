import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import Header from './Header';
import { FaBuilding, FaIndustry, FaLink, FaMapMarkedAlt, FaTasks } from 'react-icons/fa';

const Test = () => {
    const { companyId } = useParams();
    const [companyData, setCompanyData] = useState(null);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchCompanyData = async () => {
            try {
                const response = await axios.get(`http://localhost:8989/api/v1/company/details/${companyId}/`);
                setCompanyData(response.data);
            } catch (error) {
                setError(error.message);
            }
        };

        fetchCompanyData();
    }, [companyId]);

    if (error) {
        return <div className="text-red-500 text-center mt-4">Error: {error}</div>;
    }

    if (!companyData) {
        return <div className="text-center mt-4">Loading...</div>;
    }

    const renderCompanyDetail = (icon, label, value, isLink = false) => (
        <div className="flex items-center my-2">
            {icon}
            <p className="text-lg dark:text-neutral-200">
                <span className="font-semibold text-gray-700">{label}</span>
                {isLink ? (
                    <a href={value} className="text-blue-500 hover:underline" target="_blank" rel="noopener noreferrer">
                        {value}
                    </a>
                ) : (
                    `: ${value}`
                )}
            </p>
        </div>
    );

    return (
        <div className="antialiased dark:bg-gray-900">
            <Header />
            <article className="font-fira mx-auto max-w-3xl p-4 selection:bg-black selection:text-white">



                <img
                    className="float-right w-44 rounded-full pt-5"
                    src="https://st1.bollywoodlife.com/wp-content/uploads/2024/05/1-50.png?impolicy=Medium_Widthonly&w=400&h=711"
                    alt="Company Logo"
                />
                <div className="py-3 ">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">Company Profile</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <div className="space-y-4 pt-3">
                        {renderCompanyDetail(<FaBuilding className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Company Icon" />, 'Company Name', companyData.company_name)}
                        {renderCompanyDetail(<FaMapMarkedAlt className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Head Office Icon" />, 'Head Office', companyData.head_office)}
                        {renderCompanyDetail(<FaIndustry className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Industry Icon" />, 'Industry', companyData.company_type)}
                        {renderCompanyDetail(<FaTasks className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Specialization Icon" />, 'Specialization', companyData.specialization)}
                        {renderCompanyDetail(<FaLink className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Website Icon" />, 'Website :', companyData.company_website, true)}
                    </div>
                </div>

                <section className="mt-12">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">About Company</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <p className="mt-6 text-lg dark:text-neutral-200">{companyData.description}</p>
                </section>

                <section className="mt-12">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">Location</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <p className="mt-6 text-lg dark:text-neutral-200">Location : {companyData.location}</p>
                    <iframe
                        src={`https://www.google.com/maps/embed?pb=${companyData.location}`}
                        className="rounded-lg w-full h-64 pt-5"
                        style={{ border: 0 }}
                        allowFullScreen
                        loading="lazy"
                        referrerPolicy="no-referrer-when-downgrade"
                        title="Company Location"
                    />
                </section>

                <div class="flex items-center space-x-4 pt-10">
                    <button type="button" class="text-red-600 inline-flex items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">
                        Go back
                    </button>
                    <button type="submit" class="text-white bg-amber-600 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                        Edit profile
                    </button>
                </div>
            </article>
        </div>
    );
};



      {/* Main modal */}
      {isModalOpen && (
        <div className="fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-modal md:h-full overflow-y-auto overflow-x-hidden">
          <div className="relative p-4 w-full max-w-2xl h-full md:h-auto">
            {/* Modal content */}
            <div className="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
              {/* Modal header */}
              <div className="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
                <h3 className="text-lg font-semibold text-amber-600 dark:text-white">
                  Resume
                </h3>
                <button
                  onClick={toggleModal}
                  className="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                >
                  <svg
                    aria-hidden="true"
                    className="w-5 h-5"
                    fill="currentColor"
                    viewBox="0 0 20 20"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      fillRule="evenodd"
                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                      clipRule="evenodd"
                    ></path>
                  </svg>
                  <span className="sr-only">Close modal</span>
                </button>
              </div>
              {/* Modal body */}
              {/* {loading ? (
                <Spinner />
              ) : ( */}
                <embed className="pdf" src={jobUrl} width="800" height="500" />
              {/* )} */}
            </div>
          </div>
        </div>
      )}

export default Test;
