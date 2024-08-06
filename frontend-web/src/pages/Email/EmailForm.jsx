import { useState, useEffect } from 'react';
import axiosInstance from 'src/utils/axiosInstance';
import { FaCheckCircle, FaTimesCircle } from 'react-icons/fa'; // Import the icons
import Swal from 'sweetalert2'; // Import SweetAlert2

const EmailForm = ({ applicationId }) => {
  const [loading, setLoading] = useState(false);
  const [status, setStatus] = useState(null); // State to hold the updated status
  const [statusUpdated, setStatusUpdated] = useState(false); // State to control status display

  // Load status from local storage on component mount
  useEffect(() => {
    const storedStatus = localStorage.getItem(`application_${applicationId}_status`);
    if (storedStatus) {
      setStatus(storedStatus);
      setStatusUpdated(true); // Set statusUpdated to true if there's a stored status
    }
  }, [applicationId]);

  const updateStatus = (isApproved, isRejected) => {
    if (!applicationId) {
      console.error("Application ID is undefined");
      return;
    }

    setLoading(true);
    axiosInstance.post(`application/${applicationId}/status/update/`, {
      is_approved: isApproved,
      is_rejected: isRejected,
    })
      .then(response => {
        console.log('Status updated:', response.data);
        const newStatus = isApproved ? 'Accepted' : 'Rejected';
        setStatus(newStatus);
        setStatusUpdated(true); // Set statusUpdated to true after update
        localStorage.setItem(`application_${applicationId}_status`, newStatus); // Save status to local storage
      })
      .catch(error => {
        console.error('There was an error updating the status!', error);
        if (error.response) {
          console.error('Response data:', error.response.data);
          console.error('Response status:', error.response.status);
          console.error('Response headers:', error.response.headers);
        } else if (error.request) {
          console.error('Request data:', error.request);
        } else {
          console.error('Error message:', error.message);
        }
      })
      .finally(() => {
        setLoading(false);
      });
  };

  // Show SweetAlert2 confirmation dialog
  const handleStatusChange = (isApproved, isRejected) => {
    Swal.fire({
      title: 'Are you sure?',
      text: `Do you want to ${isApproved ? 'approve' : 'reject'} this application?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#F27C1C',
      cancelButtonColor: '#d33',
      confirmButtonText: isApproved ? 'Yes, approve it!' : 'Yes, reject it!',
      cancelButtonText: 'Cancel',
    }).then((result) => {
      if (result.isConfirmed) {
        updateStatus(isApproved, isRejected);
      }
    });
  };

  // Determine the background color based on the status
  const getStatusBackground = () => {
    switch (status) {
      case 'Accepted':
        return 'py-2 px-3 bg-green-50 font-medium text-green-600'; // Green background for Accepted
      case 'Rejected':
        return 'py-2 px-3 bg-red-50 font-medium text-red-600'; // Red background for Rejected
      default:
        return '';
    }
  };

  return (
    <div>
      {!statusUpdated && (
        <>
          <button 
            type="button" 
            onClick={() => handleStatusChange(true, false)} 
            disabled={loading}
            className="p-2" // Add padding to ensure the icon has space
          >
            <FaCheckCircle className="text-amber-600 w-4 h-4" />
          </button>
          <button 
            type="button" 
            onClick={() => handleStatusChange(false, true)} 
            disabled={loading}
            className="p-2" // Add padding to ensure the icon has space
          >
            <FaTimesCircle className="text-red-600 w-4 h-4" />
          </button>
        </>
      )}
      {statusUpdated && status && (
        <p className={`text-xs rounded-full inline-flex ${getStatusBackground()}`}>
          {status}
        </p> // Apply background color based on status
      )}
    </div>
  );
};

export default EmailForm;
