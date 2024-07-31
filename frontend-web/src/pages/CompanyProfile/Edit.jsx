import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axiosInstance from 'src/utils/axiosInstance';
import Swal from 'sweetalert2';
import Header from '../CompanyPost/Header';
const Edit = () => {
  const navigate = useNavigate();
  const [companyData, setCompanyData] = useState({
    company_name: '',
    location: '',
    description: '',
    head_office: '',
    employee_size: '',
    company_type: '',
    specialization: '',
    company_website: '',
    company_pic: '',
  });
  const [message, setMessage] = useState(null);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const fetchCompanyData = async () => {
      try {
        const { data } = await axiosInstance.get('account/company-profile/');
        setCompanyData(data.body);
      } catch (error) {
        setMessage(error.message);
      }
    };

    fetchCompanyData();
  }, []);

  const handleChange = ({ target: { name, value } }) => {
    setCompanyData((prev) => ({ ...prev, [name]: value }));
  };

  const handleFileChange = ({ target: { files } }) => {
    if (files[0]) {
      setCompanyData((prev) => ({
        ...prev,
        company_pic: files[0],
      }));
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMessage(null);

    const formData = new FormData();
    Object.entries(companyData).forEach(([key, value]) => {
      if (key === 'company_pic' && !value) return; // Only append the file if it's available
      formData.append(key, value);
    });


    try {
      await axiosInstance.put('account/company-profile/', formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      });

      // show the successful message 
      Swal.fire({
        title: 'Success!',
        text: 'Update successfully',
        icon: 'success',
        timer: 3000,
        timerProgressBar: true,
        showConfirmButton: false, // Hide the "OK" button
        willClose: () => {
          navigate('/company/profile'); // Redirect after alert is closed
        }
      });
    } catch (err) {
      console.error('Error updating job data:', err);
      // Show error alert
      Swal.fire({
        title: 'Error!',
        text: err.response?.status === 404
          ? 'Validation failed or resource not found'
          : `Something went wrong: ${err.response?.data?.message || err.message}`,
        icon: 'error',
        timer: 3000, // Show alert for 3 seconds
        timerProgressBar: true,
        showConfirmButton: false, // Hide the "OK" button
        willClose: () => {
          setLoading(false);
        }
      });

    } finally {
      setLoading(false);
    }


  };



  return (
    <>

      <Header />
      <section className="bg-white dark:bg-gray-900 mt-8">
        <div className="py-8 px-4 mx-auto max-w-2xl lg:py-16">
          <h2 className="mb-4 text-xl font-bold text-gray-900 dark:text-white">Update company profile</h2>
          <form onSubmit={handleSubmit}>
            <div className="grid gap-4 mb-4 sm:grid-cols-2">
              <div>
                <label htmlFor="name" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Name
                </label>
                <input
                  type="text"
                  name="company_name"
                  value={companyData.company_name}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="Company name"
                  required
                />
              </div>

              <div>
                <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Head office
                </label>
                <input
                  type="text"
                  name="head_office"
                  value={companyData.head_office}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="Los Angeles"
                  required
                />
              </div>

              <div>
                <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Industry
                </label>
                <input
                  type="text"
                  name="company_type"
                  value={companyData.company_type}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="Public"
                  required
                />
              </div>

              <div>
                <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Specialization
                </label>
                <input
                  type="text"
                  name="specialization"
                  value={companyData.specialization}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="Manager team"
                  required
                />
              </div>

              <div>
                <label htmlFor="link" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Website
                </label>
                <input
                  type="link"
                  name="company_website"
                  value={companyData.company_website}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="flowbite.com"
                  required
                />
              </div>

              <div>
                <label htmlFor="number" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Number of employees
                </label>
                <input
                  type="number"
                  name="employee_size"
                  value={companyData.employee_size}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="10-50"
                  required
                />
              </div>

            </div>
            <div className="grid gap-4 mb-4 sm:grid-cols-1">
              <div>
                <label htmlFor="location" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Location
                </label>
                <input
                  type="text"
                  name="location"
                  value={companyData.location}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="New York"
                  required
                />
              </div>
            </div>
            <div className="sm:col-span-2">
              <label htmlFor="description" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Description
              </label>
              <textarea
                id="description"
                rows={4}
                name="description"
                value={companyData.description}
                onChange={handleChange}
                className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                placeholder="Write description here"
              ></textarea>
            </div>

            <div className="grid gap-4 mb-4 sm:grid-cols-2 pt-5">
                <input
                  type="file"
                  name="company_pic"
                  onChange={handleFileChange}
                  className="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
                  accept="image/*"
                />

              </div>

            

            {message && (
              <div className="mt-4">
                <p
                  className={`text-sm ${message.includes('successfully') ? 'text-green-500' : 'text-red-500'}`}
                >
                  {message}
                </p>
              </div>
            )}

            <div className="flex items-center space-x-4 pt-5">
              <button
                type="submit"
                className="text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                disabled={loading}
              >
                {loading ? 'Updatting...' : 'Update'}
              </button>

              <Link to="/company/profile">
                <button
                  type="button"
                  className="text-red-600 inline-flex items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900"
                >
                  Cancel
                </button>
              </Link>
            </div>
          </form>
        </div>
      </section>

    </>
  );
};

export default Edit;





















