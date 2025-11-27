FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-lock.yml conda-lock.yml

#RUN mamba update --quiet --file conda-lock.yml \
#	&& mamba clean --all -y -f \
#	&& fix-permissions "${CONDA_DIR}" \
#	&& fix-permissions "/home/${NB_USER}"

RUN conda install -n base -c conda-forge conda-lock -y
RUN conda-lock install -n dockerlock conda-lock.yml

#RUN conda install -y --quiet \
#    jupyter \
#    jupyterlab=3.*
	
#python=3.11
