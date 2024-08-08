import { useEffect, useState } from 'react';
import axiosInstance from 'src/utils/axiosInstance'; // Ensure this path is correct

const CountAccept = () => {
    const [counts, setCounts] = useState({ approved_count: 0 });
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
   
            <p>{counts.approved_count}</p>

        </div>
    );
};

export default CountAccept;
