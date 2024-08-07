import React, { useEffect, useState } from 'react';
import { FaCheckCircle, FaFilePdf, FaTimesCircle } from 'react-icons/fa';
import Spinner from 'src/components/SmallComponents/Spinner';
import axiosInstance from 'src/utils/axiosInstance';

const TotalCandidate = ({ jobId }) => {
  const [postData, setPostData] = useState(null); // Initialize as null to handle loading state
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPostData = async () => {
      try {
        const response = await axiosInstance.get(`internship/application/count/?internship_post=${jobId}`);
        setPostData(response.data.body.application_count);
        console.log(response.data.body);
      } catch (error) {
        console.error("Error fetching post data:", error);
        setError(error.message);
      }
    };

    fetchPostData();
  }, [jobId]);

  if (error) {
    return <div className="text-red-500 text-center mt-4">Error: {error}</div>;
  }

  if (postData === null) {
    return <Spinner />;
  }

  return (
    <>
      {postData}
    </>
  );
};

export default TotalCandidate;
