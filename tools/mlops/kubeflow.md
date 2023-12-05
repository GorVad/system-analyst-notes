# About
The Kubeflow project is dedicated to making deployments of machine learning (ML) workflows on Kubernetes simple, portable and scalable. Our goal is not to recreate other services, but to provide a straightforward way to deploy best-of-breed open-source systems for ML to diverse infrastructures. Anywhere you are running Kubernetes, you should be able to run Kubeflow.

# Architecture
![Alt text](mlops-img\kubeflow-img\kubeflow-architecture-image.png)  
Kubeflow builds on Kubernetes as a system for deploying, scaling, and managing complex systems.

# Kubeflow components in ML workflow
![Alt text](mlops-img\kubeflow-img\kubeflow-components-ml-wf-image.png)

Components are divided into:
1. **Central Dashboard** - The central user interface (UI) in Kubeflow
2. **Kubeflow Notebooks** - provides a way to run web-based development environments inside your Kubernetes cluster by running them inside Pods.
Key features include:
    - Native support for *JupyterLab*, *RStudio*, and *Visual Studio Code* (code-server).
    - Users can create notebook containers directly in the cluster, rather than locally on their workstations.
    - Admins can provide standard notebook images for their organization with required packages pre-installed.
    - Access control is managed by Kubeflow’s RBAC, enabling easier notebook sharing across the organization.
3. **Kubeflow Pipelines** - is a platform for building and deploying portable and scalable machine learning (ML) workflows using Docker containers. A pipeline is a definition of a workflow that composes one or more components together to form a computational directed acyclic graph (DAG). At runtime, each component execution corresponds to a single container execution, which may create ML artifacts. Pipelines may also feature control flow.  
It enables data scientists and machine learning engineers to:
    - Author end-to-end ML workflows natively in Python
    - Create fully custom ML components or leverage an ecosystem of existing components
    - Easily manage, track, and visualize pipeline definitions, runs, experiments, and ML artifacts
    - Efficiently use compute resources through parallel task execution and through caching to eliminating redundant executions
    - Maintain cross-platform pipeline portability through a platform-neutral IR YAML pipeline definition
4. **Katib** - a Kubernetes-native project for automated machine learning (AutoML). Katib supports hyperparameter tuning, early stopping and neural architecture search (NAS). Learn more about AutoML at *fast.ai*, *G*oogle Cloud*, *Microsoft Azure* or *Amazon SageMaker*.
5. **Training Operators** - Training of ML models in Kubeflow through operators


# Source
1. [IBM: What is Kubeflow?](https://www.youtube.com/watch?v=Dbwj-NHnHfw) [eng]
2. [Google: Introduction to Kubeflow](https://www.youtube.com/watch?v=cTZArDgbIWw) [eng]
3. [IT-people: Best Practices for Kubeflow Pipelines](https://www.youtube.com/watch?v=TsALZXmdKSg) [rus]