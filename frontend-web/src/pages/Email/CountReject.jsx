import { useEffect, useState } from 'react';
import axiosInstance from 'src/utils/axiosInstance'; // Ensure this path is correct

const CountReject = () => {
    const [counts, setCounts] = useState({ rejected_count: 0 });
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchCounts = async () => {
            try {
                const response = await axiosInstance.get('application-counts/');
                setCounts(response.data);
            } catch (error) {
                setError(error);
            } finally {
                setLoading(false);
            }
        };

        fetchCounts();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error.message}</div>;

    return (
        <div>
            <h1></h1>

            <p> {counts.rejected_count}</p>
        </div>
    );
};

export default CountReject;
