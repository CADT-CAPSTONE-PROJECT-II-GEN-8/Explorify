import React from 'react'

const CoverLetter = () => {
    const [jobs, setJobs] = useState([]);
    useEffect(() => {
        axios
          .get("http://localhost:8989/api/v1/application/1/cover-letter/")
          .then((response) => setJobs(response.data))
          .catch((error) => console.error("Error fetching data", error));
      }, []);
    
  return (
     
    <>
    <p>{jobs.cover_letter}</p>
    </>
  )
}

export default CoverLetter