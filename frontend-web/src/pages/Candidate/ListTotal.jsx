import { useEffect, useState } from 'react';
import { FaCheckCircle, FaTimesCircle } from 'react-icons/fa';
import { useParams } from 'react-router-dom';
import axiosInstance from 'src/utils/axiosInstance';
import CoverLetter from './CoverLetter';
import CV from './CV'; // Import the CV component

const ListTotal = () => {
    const { postId } = useParams(); // Correct destructuring of useParams
    const [postData, setPostData] = useState([]);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axiosInstance.get(`internship/${postId}/applications/`);
                setPostData(response.data);
                console.log(response.data); // Check data in the console
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };

        fetchData();
    }, [postId]);

    return (
        <div className="py-16">
            <div className="container mx-auto px-4">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {postData.length > 0 ? postData.map((candidate) => (
                        <div key={candidate.internship_application_id} className="bg-white rounded-lg shadow-lg p-6">
                            <div className="inline-flex items-center pt-2">
                                <CV postId={candidate.internship_application_id} />
                                <p className="text-blue-500 text-sm underline">Resume</p>
                            </div>
                            <div className="inline-flex items-center pt-2">
                                <CoverLetter postId={candidate.internship_application_id} />
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
                    )) : <p>No applications found.</p>}
                </div>
            </div>
        </div>
    );
};

export default ListTotal;
