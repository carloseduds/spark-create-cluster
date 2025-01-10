# Cluster Apache Spark com Docker e Jupyter Notebook

Este projeto tem como objetivo criar e gerenciar um cluster Apache Spark utilizando Docker e Docker Compose. Ele fornece um ambiente completo para processamento distribuído de dados e análises interativas usando PySpark no Jupyter Notebook.

## Tecnologias Utilizadas

- **Apache Spark**: Processamento distribuído de dados.
- **Docker e Docker Compose**: Para criação e orquestração do cluster Spark.
- **Jupyter Notebook**: Ambiente interativo para códigos em PySpark.

## Estrutura do Projeto

- `docker-compose.yml`: Arquivo de orquestração dos contêineres.
- `dockerfiles/`: Contém as definições dos contêineres do Spark e Jupyter.
- `datasets/`: Diretório para armazenar datasets utilizados nos notebooks.
- `projetos/`: Contém os notebooks e códigos PySpark do projeto.
- `config/`: Arquivos de configuração do Spark.

## Configuração do Ambiente

### Requisitos

- [Docker](https://www.docker.com/) instalado.
- [Docker Compose](https://docs.docker.com/compose/) configurado.

### Instalação e Execução

1. Clone este repositório em sua máquina:
   ```bash
   git clone https://github.com/carloseduds/spark-create-cluster.git
   cd spark-create-cluster
   ```

2. Inicie o cluster Spark:
   ```bash
   docker compose -f docker-compose.yml up -d --scale spark-worker=2
   ```
   Esse comando inicia o Spark Master, History Server, dois Spark Workers e o Jupyter Notebook.
   **Nota**: Se a quantidade de Workers não for especificada com o parâmetro --scale, o Docker Compose criará 3 Workers por padrão, conforme definido no arquivo docker-compose.yml.

3. Acesse as interfaces:

   - **Spark Master UI**: [http://localhost:9090](http://localhost:9090)
   - **Spark History Server**: [http://localhost:18080](http://localhost:18080)
   - **Jupyter Notebook**: [http://localhost:8888](http://localhost:8888)
   - **Spark Web UI**: [http://localhost:4040](http://localhost:4040)

4. Se necessário, obtenha o token gerado para acessar o Jupyter Notebook:
   ```bash
   docker logs jupyter-lab
   ```

5. Para desligar o cluster:
   ```bash
   docker compose -f docker-compose.yml down
   ```

## Diretórios Principais

- **datasets/**: Coloque aqui seus arquivos de dados para análise.
- **projetos/**: Contém os notebooks e scripts PySpark.

## Escalando o Cluster

Você pode alterar o número de Spark Workers conforme a necessidade, utilizando o parâmetro `--scale` no comando acima.

Exemplo:
```bash
docker compose -f docker-compose.yml up -d --scale spark-worker=3
```

## Problemas Comuns

1. **Conflito de Portas**: Verifique se as portas `9090`, `18080` e `8888` estão livres.
2. **Permissões de Arquivos**: Certifique-se de que os diretórios `datasets` e `projetos` têm permissões adequadas para leitura/escrita.

## Contribuições

São bem-vindas contribuições para melhorar este projeto. Por favor, envie um pull request ou abra uma issue com sugestões.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).

