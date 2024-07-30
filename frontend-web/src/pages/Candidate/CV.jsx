import React from 'react'

const CV = () => {
    const [jobs, setJobs] = useState([]);
    useEffect(() => {
        axios
          .get("http://localhost:8989/api/v1/application/1/cv/")
          .then((response) => setJobs(response.data))
          .catch((error) => console.error("Error fetching data", error));
      }, []);
    
  return (
    <>
    <p>{jobs.cv}</p>
    </>
  )
}

export default CV