import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import Pagination from 'src/components/Pagination';
import Search from 'src/components/Search';
import axiosInstance from 'src/utils/axiosInstance';
import EmailForm from '../Email/EmailForm';
import Header from '../JobPosting/Header';
import CoverLetter from './CoverLetter';
import CV from './CV'; // Import the CV component

const ListTotal = () => {
    const { applicationId } = useParams();
    const [postData, setPostData] = useState([]);
    const [filteredJobs, setFilteredJobs] = useState([]);
    const [searchTerm, setSearchTerm] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage] = useState(10);

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axiosInstance.get(`internship/list/all/?internship_post_id=${applicationId}`);
                setPostData(response.data);
                setFilteredJobs(response.data); // Initialize filteredJobs with fetched data
                console.log(response.data); // Check data in the console
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        };

        fetchData();
    }, [applicationId]);

    useEffect(() => {
        // Filter jobs based on the search term
        setFilteredJobs(
            postData.filter(job =>
                job.username.toLowerCase().includes(searchTerm.toLowerCase())
            )
        );
        setCurrentPage(1); // Reset to first page when search term changes
    }, [searchTerm, postData]);

    const totalPages = Math.ceil(filteredJobs.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const currentItems = filteredJobs.slice(startIndex, endIndex);

    const handlePageChange = (newPage) => {
        setCurrentPage(newPage);
    };

    const handleSearchChange = (value) => {
        setSearchTerm(value);
    };

    return (
        <>
            <Header />
            <div className='pt-8'></div>
            <div className="py-6 bg-gray-100">
                {/* Use Search component */}
                <div className="flex flex-col items-center justify-between p-4 space-y-3 md:flex-row md:space-y-0 md:space-x-4">
                    <div className="w-full md:w-1/2">
                        <Search searchTerm={searchTerm} onSearchChange={handleSearchChange} />
                    </div>
                </div>
                <div className="container mx-auto px-4 pt-6 pb-6">
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        {currentItems.length > 0 ? (
                            currentItems.map((candidate) => (
                                <div key={candidate.id} className="bg-white rounded-lg shadow-lg p-6 hover:shadow-xl transition-shadow duration-300">
                                    <div className="relative overflow-hidden rounded-lg">
                                        <img className="object-cover w-full h-32 rounded-t-lg" src={candidate.profile_pic} alt="Candidate" />
                                        <div className="absolute inset-0 bg-black opacity-25 rounded-t-lg" />
                                    </div>
                                    <div className="mt-4">
                                        <h3 className="text-lg font-bold text-gray-900">{candidate.username}</h3>
                                        <p className="text-gray-500 text-sm mt-1">{candidate.job_title}</p>
                                    </div>

                                    <div className="flex items-center pt-2">
                                        <CV applicationId={candidate.internship_application_id} />
                                        <p className="text-blue-500 text-sm">Resume</p>
                                    </div>

                                    <div className="flex items-center pt-2">
                                        <CoverLetter applicationId={candidate.internship_application_id} />
                                        <p className="text-blue-500 text-sm">Cover Letter</p>
                                    </div>

                                    <div className="flex items-center justify-end mt-4">
                                        <EmailForm applicationId={candidate.internship_application_id} />
                                    </div>
                                </div>
                            ))
                        ) : null}

                    </div>
                    {/* Pagination Controls */}
                    <Pagination
                        currentPage={currentPage}
                        totalPages={totalPages}
                        onPageChange={handlePageChange}
                    />
                </div>
            </div>
        </>
    );
};

export default ListTotal;
