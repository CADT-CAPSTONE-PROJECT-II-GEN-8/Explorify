import { useEffect, useState } from 'react';
import axiosInstance from 'src/utils/axiosInstance';
import 'src/pages/JobPosting/job.css';
const CV = () => {
  const [jobs, setJobs] = useState(null);

  useEffect(() => {
    axiosInstance
      .get("application/1/cover-letter/", { responseType: "blob" })
      .then((response) => { 
        const pdfBlob = new Blob([response.data], {type: "application/pdf"});
        const url = window.URL.createObjectURL(pdfBlob)
        setJobs(url); 
      })
      .catch((error) => console.error("Error fetching data", error));
  }, []);

  return (
    <>
      {/* <div className="w-100 h-500">
<iframe src={jobs}    />
</div> */}

      <embed className="pdf"
        src=
        {jobs}
        width="800" height="500"></embed>
      <p>Hello </p>
    </>
  );
};

export default CV;
