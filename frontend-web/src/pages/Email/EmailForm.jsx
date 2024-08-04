import React, { useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';

const EmailForm = () => {
  const { id } = useParams();  // Extract ID from URL parameters
  const [loading, setLoading] = useState(false);

  const updateStatus = (isApproved, isRejected) => {
    if (!id) {
      console.error("Application ID is undefined");
      return;
    }

    setLoading(true);
    axios.post(`http://localhost:8989/api/v1/application/${id}/status/`, {
      is_approved: isApproved,
      is_rejected: isRejected,
    })
    .then(response => {
      console.log('Status updated:', response.data);
    })
    .catch(error => {
      console.error('There was an error updating the status!', error);
    })
    .finally(() => {
      setLoading(false);
    });
  };

  return (
    <div>
      <button onClick={() => updateStatus(true, false)} disabled={loading}>
        Accept
      </button>
      <button onClick={() => updateStatus(false, true)} disabled={loading}>
        Reject
      </button>
    </div>
  );
};

export default EmailForm;
