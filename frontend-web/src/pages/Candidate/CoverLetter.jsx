import { useEffect, useState } from 'react';
import Spinner from 'src/components/SmallComponents/Spinner';
import 'src/pages/JobPosting/job.css';
import axiosInstance from 'src/utils/axiosInstance';

const CoverLetter = ({ applicationId }) => { // Destructure applicationId from props
  const [jobUrl, setJobUrl] = useState(null);
  const [loading, setLoading] = useState(true);
  const [isModalOpen, setIsModalOpen] = useState(false);

  useEffect(() => {
    const fetchCV = async () => {
      console.log('Fetching CV for applicationId:', applicationId);
      try {
        if (applicationId) {
          const response = await axiosInstance.get(`application/${applicationId}/cover-letter/`, {
            responseType: 'blob',
          });

          if (response.status === 200) {
            const pdfBlob = new Blob([response.data], { type: 'application/pdf' });
            const url = window.URL.createObjectURL(pdfBlob);
            setJobUrl(url);
            console.log('PDF URL created:', url);
          } else {
            console.error(`Unexpected response status: ${response.status}`);
          }
        } else {
          console.error('No applicationId provided');
        }
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchCV();
  }, [applicationId]);

  const toggleModal = () => {
    setIsModalOpen((prev) => !prev);
  };

  return (
    <>
      {/* Modal toggle button */}
      <div className="text-blue-600 underline">
        <a href="#" onClick={toggleModal}>
          View Resume
        </a>
      </div>

      {/* Main modal */}
      {isModalOpen && (
        <div
          className="fixed top-0 right-0 left-0 z-50 flex justify-center items-center w-full md:inset-0 h-modal md:h-full overflow-y-auto overflow-x-hidden"
        >
          <div className="relative p-4 w-full max-w-2xl h-40 md:h-auto">
            {/* Modal content */}
            <div className="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
              {/* Modal header */}
              <div className="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
                <h3 className="text-lg font-semibold text-amber-600 dark:text-white">
                  Cover Letter
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
              {loading ? (
                <Spinner />
              ) : jobUrl ? (
                <embed className="pdf" src={jobUrl} width="900" height="600" />
              ) : (
                <p>Error loading PDF</p>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default CoverLetter;
