import React, { useLayoutEffect, useState } from 'react';
import { getCurrency } from '../Utils';

export const Services = () => {
    const [services, setServices] = useState([])
    const [loading, setLoading] = useState(true);

    useLayoutEffect(() => {
        const getServices = async() => {
            const res = await fetch('/api/services')
            const services = await res.json()
            setServices(services)
        }
        getServices().catch(e => {
            console.log("error fetching services: " + e);
        })

        Promise.all([getServices()])
            .then(() => setLoading(false))
            .catch((e) => {
                console.log('Error fetching products or vendors: ' + e);
                setLoading(false);
            });
    },[])

    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            {services.map(service => {
                const {
                    serviceId,
                    name,
                    price
                } = service;
                return (
                    <tr key={service}>
                        <td>{serviceId}</td>
                        <td>{name}</td>
                        <td>{getCurrency(price)}</td>
                    </tr>
                )
            })}
            </tbody>
        </table>
    )
}


export default Services;