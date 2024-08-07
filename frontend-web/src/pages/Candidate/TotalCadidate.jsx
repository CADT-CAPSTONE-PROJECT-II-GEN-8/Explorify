import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { FaCheckCircle, FaFilePdf, FaTimesCircle } from 'react-icons/fa';
import Spinner from 'src/components/SmallComponents/Spinner';
import axiosInstance from 'src/utils/axiosInstance';
import Header from '../JobPosting/Header'; // Adjust the path as needed

const TotalCandidate = () => {
  const { postId } = useParams();
  const [postData, setPostData] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPostData = async () => {
      try {
        const response = await axiosInstance.get(`internship/application/count/?internship_post=${postId}`);
        setPostData(response.data.body.application_count);
        console.log(response.data.body)
      } catch (error) {
        console.error("Error fetching post data:", error);
        setError(error.message);
      }
    };

    fetchPostData();
  }, [postId]);

  if (error) {
    return <div className="text-red-500 text-center mt-4">Error: {error}</div>;
  }

  // if (postData) {
  //   return <Spinner />;
  // }

  return (
    <>
      <Header />
      <div className="py-16">
        <div className="container mx-auto px-4">
          {postData}
          {/* <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {postData.map((candidate) => (
              <div className="bg-white rounded-lg shadow-lg p-6">
                <div className="relative overflow-hidden">
                  <img className="object-cover w-full h-32" src={candidate.profilePicture || "https://images.unsplash.com/photo-1542291026-7eec264c27ff"} alt="Candidate" /> 
                  <div className="absolute inset-0 bg-black opacity-40" />
                </div>
                 <h3 className="text-md font-bold text-gray-900 mt-4">{candidate.job_title}</h3> 
                 <p className="text-gray-500 text-sm mt-2">{candidate.description}</p> 
                <div className="inline-flex items-center pt-2">
                  <FaFilePdf className="mr-3 text-amber-600 w-4 h-4" />
                  <p className="text-blue-500 text-sm underline">Resume</p>
                </div>
                <div className="inline-flex items-center pt-2">
                  <FaFilePdf className="mr-3 text-amber-600 w-4 h-4" />
                  <p className="text-blue-500 text-sm underline">Cover letter</p>
                </div>

                <div className="flex items-center justify-between pt-4">
                  <button className="flex items-center">
                    <FaTimesCircle className="mr-2 text-red-500" />
                    <p className='text-sm text-red-500'>Reject</p>
                  </button>
                  <button type="button" className="text-white px-3 py-1 text-xs bg-[#FF9119] hover:bg-[#FF9119]/80 focus:ring-4 focus:outline-none focus:ring-[#FF9119]/50 rounded-lg text-center inline-flex items-center">
                    <FaCheckCircle className="mr-2 text-white" />
                    Accept
                  </button>
                </div>
              </div>
            ))}
          </div> */}
        </div>
      </div>
    </>
  );
};

export default TotalCandidate;
