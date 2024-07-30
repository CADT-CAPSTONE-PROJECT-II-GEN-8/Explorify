import { Link } from 'react-router-dom';
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import Header from './Header';
import { FaDollarSign, FaGraduationCap, FaCalendarAlt, FaMapMarkerAlt, FaBriefcase } from 'react-icons/fa';
import DOMPurify from 'dompurify';

const JobDetail = () => {
    const { jobId } = useParams();
    const [jobData, setJobData] = useState(null);
    const [error, setError] = useState(null);
    const sanitizedHTML = DOMPurify.sanitize(jobData ? jobData.job_requirement : '');

    useEffect(() => {
        const fetchJobData = async () => {
            try {
                const response = await axios.get(`http://localhost:8989/api/v1/post/details/${jobId}/`);
                setJobData(response.data);
            } catch (error) {
                setError(error.message);
            }
        };

        fetchJobData();
    }, [jobId]);

    if (error) {
        return <p>Error: {error}</p>;
    }

    if (!jobData) {
        return <p>Loading...</p>;
    }

    const apiKey = 'GOOGLE_MAP_API_KEY'; // Replace with  actual Google Maps Embed API key
    const formattedLocation = encodeURIComponent(jobData.location);

    return (
        <>
            <Header />
            <div className="flex min-h-screen items-center justify-center p-10 bg-white mt-10">
                <section id="features" className="container space-y-6 mx-auto md:py-12 lg:pb-12 lg:pt-1">
                    <div className="mx-auto grid justify-center gap-4 sm:grid-cols-1 md:max-w-[64rem] md:grid-cols-1">
                        <div className="relative overflow-hidden rounded-lg border p-2">
                            <div className="flex h-auto flex-col justify-between rounded-md p-6">
                                <h2 className="text-3xl font-poppins font-bold text-amber-500 pb-4">{jobData.job_title}</h2>
                                <div className="max-w-4xl mx-auto px-5 ">
                                    <div className="grid md:grid-cols-1 gap-10 mt-10">
                                        <div className="flex gap-4 items-start">
                                            <div>
                                                <h3 className="font-semibold text-lg">Description</h3>
                                                <p className="mt-3 text-gray-700">{jobData.job_description}</p>
                                            </div>
                                        </div>
                                        <div className="flex gap-4 items-start">
                                            <div>
                                                <h3 className="font-semibold text-lg">Requirements</h3>
                                                <p className="mt-3 text-gray-700" dangerouslySetInnerHTML={{ __html: sanitizedHTML }}></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="text-center pt-12">
                                        <p className="font-semibold text-2xl">Other Requirements</p>
                                    </div>
                                    <div className="grid md:grid-cols-2 sm-grid-cols-2 gap-10 mt-10 pl-5 md:pl-40">
                                        <div className="flex gap-4 items-start">
                                            <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
                                                <FaGraduationCap className="w-6 h-6" />
                                            </span>
                                            <div>
                                                <h3 className="font-semibold text-lg">{jobData.qualification}</h3>
                                                <p className="mt-1 text-gray-500">Qualification</p>
                                            </div>
                                        </div>
                                        <div className="flex gap-4 items-start">
                                            <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
                                                <FaDollarSign className="w-6 h-6" />
                                            </span>
                                            <div>
                                                <h3 className="font-semibold text-lg">{jobData.salary} $</h3>
                                                <p className="mt-1 text-gray-500">Salary</p>
                                            </div>
                                        </div>
                                        <div className="flex gap-4 items-start">
                                            <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
                                                <FaBriefcase className="w-6 h-6" />
                                            </span>
                                            <div>
                                                <h3 className="font-semibold text-lg">{jobData.job_type}</h3>
                                                <p className="mt-1 text-gray-500">Job type</p>
                                            </div>
                                        </div>
                                        <div className="flex gap-4 items-start">
                                            <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
                                                <FaCalendarAlt className="w-6 h-6" />
                                            </span>
                                            <div>
                                                <h3 className="font-semibold text-lg">{jobData.job_duration}</h3>
                                                <p className="mt-1 text-gray-500">Duration</p>
                                            </div>
                                        </div>
                                    </div>
                                    <section className="mt-16 md:mx-12">
                                        <p className="text-center font-semibold text-2xl">Our Location</p>
                                        <div className="flex gap-4 items-start pt-10">
                                            <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
                                                <FaMapMarkerAlt className="w-4 h-4" />
                                            </span>
                                            <div>
                                                <p className="text-lg"> Location : {jobData.location} </p>
                                            </div>
                                        </div>
                                        <div>
                                            <iframe
                                                src={`https://www.google.com/maps/embed/v1/place?q=${formattedLocation}&key=${apiKey}`}
                                                className="rounded-lg w-full h-64 pt-5"
                                                style={{ border: 0 }}
                                                allowFullScreen
                                                loading="lazy"
                                                referrerPolicy="no-referrer-when-downgrade"
                                                title="Company Location"
                                            />
                                        </div>
                                    </section>
                                </div>
                                <div className="flex items-center space-x-4 pt-5">
                                    <Link to="/job/create">
                                        <button
                                            type="button"
                                            className="text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                                        >
                                            Add new
                                        </button>
                                    </Link>
                                    <Link to="/job/table">
                                        <button
                                            type="button"
                                            className="text-red-600 inline-flex items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900"
                                        >
                                            Cancel
                                        </button>
                                    </Link>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </>
    );
};

export default JobDetail;
