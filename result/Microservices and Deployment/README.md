# Microservices and Deployment Results

The structure of these `.csv` files is slightly different from others in the repository due to the method used for data collection.

The data for **Microservice Scalability** and **Deployment Method** was collected using [Locust], a Python-based load testing tool. The output was then manually converted into `.csv` format from the Locust UI dashboard to capture key metrics such as:

- **Response Time (R)**
- **Throughput (T)**
- **Error Rate (E%)**
- **Current RPS**
- **Latency Distributions (Min, Max, Avg, Median, 95th, 99th percentiles)**

This was done to provide greater granularity and match the standardized reporting metrics Locust offers.

## Additional Details

- Locust was configured with varying user loads and ramp-up times.
- Results reflect isolated WebUI endpoints (ports 8080 and 8081) to simulate different microservice deployment strategies.

