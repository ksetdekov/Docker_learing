# info

To start, you will

* deploy a simple guestbook application that uses in-memory storage to retain the guestbook entries.
* Afterward, you will deploy a multi-tier web application that consists of a web front end,
* a Redis master and replicated slaves for storage, as well as an analyzer service that analyzes the tone of entries left in the guestbook.
* In order to utilize the analyzer service, you will have to create a free instance of Tone Analyzer in your personal IBM Cloud account.

| Task | Description | Done | Notes |
|---|---|---|---|
| 1 |  Deploy a simple v1 guestbook application. (2 points) | Yes |  |
| 2 |  Use an in-memory data store for the simple guestbook application. (1 point) |  |  |
| 3 |  Update the simple guestbook homepage to include your name. (1 point) |  |  |
| 4 |  Automatically deploy the homepage update using a second image stream tag. (1 point) |  |  |
| 5 |  Deploy the second version of the guestbook application using an OpenShift build. (5 points) |  |  |
| 6 |  Deploy a Redis master, a Redis slave, and an analyzer microservice.(3 points) |  |  |
| 7 |  Use Redis for the v2 guestbook application instead of an in-memory datastore. (1 point) |  |  |
| 8 |  Submit entries to the guestbook and have their tone analyzed. Some simple sentences will not have a tone detected. Ensure that you submit something complex enough so that its tone is detected.(2 points) |  |  |
| 9 |  Create a Horizontal Pod Autoscaler that shows guestbook as the scale target, the current and desired replicas as three, and the last scale time as the time the deployment was scaled up to three replicas (4 points) |  |  |

## code

see project.sh

After completing this course, you may be ready for your first IBM Cloud certification:  [Cloud Solution Advisor](https://www.ibm.com/training/path/41/overview).

Continue your cloud learning journey with role-based and product-based training and certifications at the [IBM Center for Cloud Training](https://www.ibm.com/training/cloud).
