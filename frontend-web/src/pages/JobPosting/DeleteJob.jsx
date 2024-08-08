import axios from 'axios';
import { useState } from 'react';
import { FaTrash } from 'react-icons/fa';
import { useNavigate } from 'react-router-dom';
import { ImSpinner8 } from 'react-icons/im'; // Import spinner icon
import Spinner from 'src/components/SmallComponents/Spinner'; // Assuming this is a custom spinner component

const DeleteJob = ({ jobId, onClose, onDelete }) => {
  const [showModal, setShowModal] = useState(false);
  const [loading, setLoading] = useState(false);
  const [deleting, setDeleting] = useState(false);
  const navigate = useNavigate();

  const deleteProgram = async () => {
    setDeleting(true);
    try {
      const { status } = await axios.delete(`http://localhost:8989/api/v1/post/delete/${jobId}/`);
      if (status === 204) {
        onDelete(jobId);
        setLoading(true); // Set loading to true to show spinner
        // Simulate delay to show spinner before navigating
        setTimeout(() => {
          setLoading(false); // Reset loading state
          navigate('/job/table');
        }, 1000); // Adjust delay as needed
      } else {
        console.error('Failed to delete');
        setDeleting(false);
      }
    } catch (error) {
      console.error('Error deleting program: ', error);
      setDeleting(false);
    }
  };

  if (loading) {
    return (
      <Spinner />
    );
  }

  return (
    <>
      <button onClick={() => setShowModal(true)}>
        <FaTrash style={{ color: 'red', cursor: 'pointer' }} />
      </button>

      {showModal && (
        <div className="fixed top-0 left-0 w-full h-full flex items-center justify-center bg-gray-800 bg-opacity-75 z-50">
          <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md relative">
            <button
              type="button"
              className="text-gray-400 absolute top-2.5 right-2.5 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5"
              onClick={() => setShowModal(false)}
            >
              <svg aria-hidden="true" className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clipRule="evenodd" />
              </svg>
              <span className="sr-only">Close modal</span>
            </button>
            <div className="flex flex-col items-center">
              <svg className="text-gray-400 w-11 h-11 mb-3.5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clipRule="evenodd" />
              </svg>
              <p className="mb-4 text-gray-500">Are you sure you want to delete this item?</p>
              <div className="flex space-x-4">
                <button
                  onClick={() => {
                    setShowModal(false);
                    onClose();
                  }}
                  className="py-2 px-3 text-sm font-medium text-gray-500 bg-white rounded-lg border border-gray-200 hover:bg-gray-100"
                >
                  No, cancel
                </button>
                <button
                  onClick={async () => {
                    await deleteProgram();
                    setShowModal(false);
                  }}
                  className="py-2 px-3 text-sm font-medium text-center text-white bg-red-600 rounded-lg hover:bg-red-700 flex items-center justify-center"
                  disabled={deleting}
                >
                  {deleting ? (
                    <>
                      <ImSpinner8 className="animate-spin mr-2" />
                      Deleting...
                    </>
                  ) : (
                    "Yes, I'm sure"
                  )}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default DeleteJob;
