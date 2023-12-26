# US EI09

## 1. Engenharia de Requsitos

### 1.1 Descrição da User Story

*  - Organizar as localidades do grafo em N clusters que garantam apenas 1 hub por cluster de localidades. Os clusters
     devem ser obtidos iterativamente através da remoção das ligações com o maior número de caminhos mais curtos entre 
     localidades até ficarem clusters isolados.

### 1.2. Especificações e Clarificações

Clarificações do Cliente:

* N/A

Clarificações dos Professores:

> *Pergunta: "tendo em conta a seguinte frase do enunciado "Organizar as localidades do grafo em N clusters que garantam 
             apenas 1 hub por cluster de localidades." podemos assumir que, após o surgimento dos N clusters, quaisquer outros 
             hubs que não estejam no conjunto N, não devem ser inseridos em nenhum cluster? 
             Esta dúvida surge, pois noutra pergunta referente à USEI09, a professora respondeu que um cluster deve 
             ter "pelo menos" um hub."

    * Resposta: "Um cluster deve ter pelo menos um hub, mas pode ter mais do que um hub. A segmentação ou os clusters 
      devem incluir todas as localidades/hubs, não devem ficar com localidades/hubs isolados."

> *Pergunta: "Gostaria de lhe pedir que explicasse, com pormenor, o conceito de cluster e também o conceito de isolação."

    * Resposta: "Nesta US tem de receber o nº de clusters por parâmetro e depois ir removendo os ramos do grafo que apresentem o maior nº de caminhos mínimos a passar por eles ( betweenness do ramo)

    Fazer
    1. Calcular o nº de caminhos mínimos que passam em cada ramo = betweenness do ramo
    2. Remover o(s) ramo(s) com maior
    Até se obter o nº de clusters pretendido.

    Ter em atenção que cada cluster deve ter pelo menos 1 hub."
    
### 1.3. Critérios de Aceitação

* AC01: Devolver lista de Hubs e o respetivo conjunto de localidades que pertencem ao cluster desse Hub.
* AC02: Não deverá fornecer soluções de clusters de localidades sem o respetivo hub.


### 1.4. Dependedências

* Dependência de US EI01, pois o grafo ja tem de estar carregado para que a funcionalidade funcione

### 1.5 Dados de Input e Output

**Input Data**

* N/A

**Selected data:**

* Opção de Ficheiro small ou ficheiro big

**Output Data**

* Grafo com clusters


### 1.6. Diagrama de Sequência de Sistema (SSD)


![USEI09-SSD](svg/SSD.svg)


### 1.7 Outros Pontos Importantes 

* N/A

## 2. Analise

### 2.1. Excerto Modelo Domínio

* N/A

### 2.2. Outros Pontos

* N/A

## 3. Design

Classes conceptuais que foram promovidas em classes de software:
* OrganizeGraphIntoClusters

Outras classes:
* OrganizeGraphIntoClustersUI
* OrganizeGraphIntoClustersController

## 3.2. Diagrama de Sequência (SD)

![USXXX-SD](US017-SD.svg)

## 3.3. Diagrama de Classes (CD)


![US EI09-CD](/svg/CD.svg)

---
# 4. Testes

**Test 1:** Testa se o número de vértices esta correto
```java
    @Test
    void testeNumVerticesSmall() throws IOException {

            GraphStore storage = new GraphStore();

            storage.clean();

            MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

            MapGraph<Local, Integer> graph = storage.getGraph();

        int expectedNumVertex = 17;
        int result = OrganizeGraphIntoClusters.organizeGraph(graph).size();

        assertNotNull(graph);
        assertEquals(expectedNumVertex, result);
        }
        

```

---
# 5. Implementação

### OrganizeGraphIntoClusters

```java
public class OrganizeGraphIntoClusters {
    public static Map<HubLocal, Set<Local>> organizeGraph(Graph<Local, Integer> graph) {

        if (graph.isDirected()) return null;

        Map<HubLocal, Set<Local>> hubList = new HashMap<>();
        List<Local> vertexList = new ArrayList<>(graph.vertices());

        while (!vertexList.isEmpty()) {

            Local hub = vertexList.get(0);

            // Encontrar os caminhos mais curtos para todos os pontos a partir do hub
            List<LinkedList<Local>> shortestPathsFromHub = new ArrayList<>();

            for (Local destination : vertexList) {

                if (!hub.equals(destination)) {

                    LinkedList<Local> shortestPath = new LinkedList<>();
                    Algorithms.shortestPathDijkstra(graph, hub, Comparator.naturalOrder(), BinaryOperator.minBy(Comparator.naturalOrder()), 0, new boolean[graph.numVertices()], new ArrayList<>(), new ArrayList<>());
                    shortestPathsFromHub.add(shortestPath);
                }
            }

            // Encontrar a aresta com o maior número de caminhos curtos
            Edge<Local, Integer> edgeToRemove = findEdgeWithMaxShortestPaths(graph, shortestPathsFromHub);

            // Remover aresta
            if (edgeToRemove != null) {
                graph.removeEdge(edgeToRemove.getVOrig(), edgeToRemove.getVDest());
            }

            // Criar novo cluster com o hub e os destinos alcançados
            Set<Local> cluster = new HashSet<>(shortestPathsFromHub.stream().flatMap(Collection::stream).collect(Collectors.toList()));
            cluster.add(hub);

            // Adicionar o hub e o cluster a lista de hubs
            hubList.put(new HubLocal(hub, cluster), cluster);

            // Remover vertices do cluster da lista de vertices
            vertexList.removeAll(cluster);
        }
        return hubList;
    }

    public static Edge<Local, Integer> findEdgeWithMaxShortestPaths(Graph<Local, Integer> graph, List<LinkedList<Local>> shortestPaths) {

        Edge<Local, Integer> edgeWithMaxShortestPaths = null;
        int maxShortestPaths = 0;

        for (Edge<Local, Integer> edge : graph.edges()) {

            int edgeShortestPaths = countShortestPaths(edge, shortestPaths);

            if (edgeShortestPaths > maxShortestPaths) {

                maxShortestPaths = edgeShortestPaths;
                edgeWithMaxShortestPaths = edge;
            }
        }
        return edgeWithMaxShortestPaths;
    }

    private static int countShortestPaths(Edge<Local, Integer> edge, List<LinkedList<Local>> shortestPaths) {

        int count = 0;

        for (LinkedList<Local> path : shortestPaths) {

            if (path.contains(edge.getVOrig()) && path.contains(edge.getVDest())) {
                count++;
            }
        }
        return count;
    }
}

```

### OrganizeGraphIntoClustersController

```java
public class OrganizeGraphIntoClustersController {

    public OrganizeGraphIntoClustersController() {

    }

    public Map<HubLocal, Set<Local>> organizeSmall() {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_small.csv", "docs/esinf_data/distancias_small.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        return OrganizeGraphIntoClusters.organizeGraph(graph);
    }

    public Map<HubLocal, Set<Local>> organizeBig() {

        GraphStore storage = new GraphStore();

        storage.clean();

        MapGraphLoader.loadGraph("docs/esinf_data/locais_big.csv", "docs/esinf_data/distancias_big.csv");

        MapGraph<Local, Integer> graph = storage.getGraph();

        return OrganizeGraphIntoClusters.organizeGraph(graph);
    }
}

```

### OrganizeGraphIntoClustersUI

```java
public class OrganizeGraphIntoClustersUI implements Runnable {

    private final OrganizeGraphIntoClustersController controller = new OrganizeGraphIntoClustersController();

    @Override
    public void run() {

        System.out.println("1. Ficheiro Small");
        System.out.println("2. Ficheiro Big");
        System.out.println();

        try {

            int option = Utils.readIntegerFromConsole("Escolha o ficheiro");

            switch (option) {

                case 1:
                    System.out.println(this.controller.organizeSmall());
                    break;

                case 2:
                    System.out.println(this.controller.organizeBig());
                    break;

                default:
                    System.out.println("Opção Inválida");
                    break;
            }

        } catch (Exception e) {

            System.err.println(e.getMessage());
        }
    }
}

```

---