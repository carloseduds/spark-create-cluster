# Use uma imagem base com OpenJDK e Python 3.11
FROM python:3.11-slim-bullseye

# Instale dependências adicionais necessárias para o Jupyter e Spark
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    openjdk-11-jdk \
    procps \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure o ambiente do Java
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Instala as dependências Python, PySpark e Jupyter
COPY ./requirements/requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install jupyterlab

# Configure o Python para PySpark
ENV PYSPARK_PYTHON=/usr/local/bin/python3.11
ENV PYSPARK_DRIVER_PYTHON=/usr/local/bin/python3.11

# Exponha a porta para o Jupyter Notebook
EXPOSE 8888

# Defina o diretório de trabalho
WORKDIR /notebook

# Comando para rodar o Jupyter Notebook
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
