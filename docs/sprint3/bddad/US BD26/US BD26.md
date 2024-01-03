# US BD30

## 1. Engenharia de Requsitos

### 1.1 Descrição da User Story

Como Gestor Agrícola, pretendo anular uma operação que estava prevista e não se realizou ou que foi criada por engano,
sabendo que isso só  possível até aos 3 dias seguintes à sua data prevista de execução, se não houver operações 
posteriores dependentes desta.

### 1.2. Especificações e Clarificações

Clarificações do Cliente:

* 

Clarificações dos Professores:

* 
    
### 1.3. Critérios de Aceitação

* AC01: Só deve ser aceite as anulações com 3 dias após a data prevista
* AC02: Só deve ser aceite as anulações de operações sem dependências

### 1.4. Dependedências

* Devem existir operações agrícolas registadas previamente no sistema


### 1.7 Outros Pontos Importantes 

* N/A

## 2. Analise

### 2.1. Excerto Modelo Domínio

![US BD30-MD](/png/DM.png)

### 2.2. Outros Pontos

* N/A

# 3. Design

Classes conceptuais que foram promovidas em classes de software:
* OperacaoAgricola

Outras classes:
* CancelarOperacaoUI
* CancelarOperacaoController

## 3.2. Diagrama de Sequência (SSD)

![US BD30-SSD](/svg/SSD.svg)

## 3.3. Diagrama de Classes (CD)

![US BD30-CD](/svg/CD.svg)

# 5. Implementação


### CancelarOperacaoUI

```java

public class CancelarOperacaoUI implements Runnable {
    private OperacaoAgricolaRepository repository = Repositories.getInstance().getOperacaoAgricolaRepository();
    private CancelarOperacaoController controller = new CancelarOperacaoController();

    @Override
    public void run() {

        try {

            controller.showOperationList();

            int SelectedId = Utils.readIntegerFromConsole("Escolha o Id da operação que deseja anular \n");

            int optValidation = Utils.readIntegerFromConsole("1-CONFIRMAR\0-CANCELAR");

            if (optValidation == 1) {

                this.repository.operacaoAgricolaCancel(SelectedId);
                System.out.println("Operação Agrícola Cancelada com sucesso.");

            } else {

                System.out.println("Cencelamento da Operação Agrícola abortada");
            }


        } catch (SQLException e) {

            System.err.println("Não foi possível cancelar a operação agrícola!\n" + e.getMessage());

        } catch (Exception e) {

            System.err.println("Ocorreu algum erro!");
            e.printStackTrace();
        }

    }
}

```

### CancelarOperacaoController

```java
public class CancelarOperacaoController {
    OperacaoAgricolaRegisterController controller1 = new OperacaoAgricolaRegisterController();

    public CancelarOperacaoController() {

    }

    public void showOperationList() throws SQLException {

        this.controller1.printTableData("Operacao_Agricola");
    }
}


```

### OperacaoAgricolaRepository

```java

public class OperacaoAgricolaRepository {


    public OperacaoAgricolaRepository() {
    }

    public List<OperacaoAgricola> getOperacoesAgricolas() throws SQLException {

        CallableStatement callStmt = null;
        ResultSet resultSet = null;
        List<OperacaoAgricola> operacaoAgricolas = null;

        try {

            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncOperacoesAgricolas() }");

            callStmt.registerOutParameter(1, OracleTypes.CURSOR);

            callStmt.execute();
            resultSet = (ResultSet) callStmt.getObject(1);

            operacaoAgricolas = resultSetToList(resultSet);

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }

            if (!Objects.isNull(resultSet)) {
                resultSet.close();
            }
        }

        return operacaoAgricolas;
    }

    public static void OperacaoAgricolaRegister(int operacaoId, Date date) throws SQLException {

        CallableStatement callStmt = null;
        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ call RegistrarOperacaoAgricola(?,?) }");

            callStmt.setInt(1, operacaoId);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            callStmt.setDate(2, sqlDate);

            callStmt.execute();
            connection.commit();
        } finally {
            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
    }


    public int operacaoAgricolaDelete(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int deletedRows = 0;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call fncOperacaoAgricolaDelete(?) }");

            callStmt.registerOutParameter(1, OracleTypes.INTEGER);
            callStmt.setInt(2, operacaoId);

            callStmt.execute();
            deletedRows = callStmt.getInt(1);

            connection.commit();

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
        return deletedRows;
    }

    public int operacaoAgricolaCancel(int operacaoId) throws SQLException {

        CallableStatement callStmt = null;
        int canceledRows = 0;

        try {
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callStmt = connection.prepareCall("{ ? = call cancel_operation(?) }");

            callStmt.registerOutParameter(1, OracleTypes.INTEGER);
            callStmt.setInt(2, operacaoId);

            callStmt.execute();
            canceledRows = callStmt.getInt(1);

            connection.commit();

        } finally {

            if (!Objects.isNull(callStmt)) {
                callStmt.close();
            }
        }
        return canceledRows;
    }


    private List<OperacaoAgricola> resultSetToList(ResultSet resultSet) throws SQLException {

        List<OperacaoAgricola> operacaoAgricolas = new ArrayList<>();

        while (true) {

            if (!resultSet.next()) break;
            OperacaoAgricola operacaoAgricola = new OperacaoAgricola(
                    resultSet.getInt("operacaoId"),
                    resultSet.getDate("date")
            );
            operacaoAgricolas.add(operacaoAgricola);
        }
        return operacaoAgricolas;
    }

}

```

### OperacaoAgricolaRegisterController

```java
public class OperacaoAgricolaRegisterController {

    private OperacaoAgricolaRepository operacaoAgricolaRepository;
    private DatabaseConnection database;

    {
        try {
            database = DatabaseConnection.getInstance();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Connection connection;


    public OperacaoAgricolaRegisterController() {
        getOperacaoAgricolaRepository();
        try {
            connection = DriverManager.getConnection(database.url(), database.user(), database.password());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private OperacaoAgricolaRepository getOperacaoAgricolaRepository() {
        if (Objects.isNull(operacaoAgricolaRepository)) {
            Repositories repositories = Repositories.getInstance();
            operacaoAgricolaRepository = repositories.getOperacaoAgricolaRepository();
        }
        return operacaoAgricolaRepository;
    }

    public void operacaoAgricolaRegister(int operacaoId, Date date) throws SQLException {
        OperacaoAgricolaRepository.OperacaoAgricolaRegister(operacaoId, date);
    }

    public int getNextId() {

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

            String query = "SELECT MAX(id) FROM OPERACAO_AGRICOLA";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query);

                 ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int maxId = resultSet.getInt(1);
                    return maxId + 1;
                } else {
                    return 1;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return -1;
    }

    public boolean isIdValid(String tableName, int id) throws SQLException {
        Connection connection = DatabaseConnection.getInstance().getConnection();
        String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        }
        return false;
    }

    public List<String[]> getTableData(String tableName) {

        List<String[]> result = new ArrayList<>();

        try {

            String query = "SELECT * FROM " + tableName;

            try (PreparedStatement preparedStatement = connection.prepareStatement(query);

                 ResultSet resultSet = preparedStatement.executeQuery()) {

                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();

                while (resultSet.next()) {

                    String[] row = new String[columnCount];
                    for (int i = 1; i <= columnCount; i++) {
                        row[i - 1] = resultSet.getString(i);
                    }
                    result.add(row);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    public void printTableData(String tableName) {

        List<String[]> data = getTableData(tableName);

        if (data.isEmpty()) {
            System.out.println("No data found in the table.");
            return;
        }

        String[] columnNames = getColumnNames(tableName);

        if (columnNames != null) {
            printTableHeader(columnNames);
        }

        for (String[] row : data) {
            printTableLine(row);
        }
    }

    private String[] getColumnNames(String tableName) {
        try {
            String query = "SELECT * FROM " + tableName + " WHERE ROWNUM <= 1";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                String[] columnNames = new String[columnCount];

                for (int i = 1; i <= columnCount; i++) {
                    columnNames[i - 1] = metaData.getColumnName(i);
                }

                return columnNames;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private void printTableHeader(String[] values) {
        System.out.printf("%50s|\t%50s|\n", values[0], values[1]);
        printTableSeparator(2);
    }

    private void printTableLine(String[] values) {
        System.out.printf("%50s|\t%50s|\n", values[0], values[1]);
        printTableSeparator(2);
    }

    private void printTableSeparator(int columnCount) {

        for (int i = 0; i < columnCount; i++) {
            System.out.printf("%50s|\t", "--------------------------------------------------");
        }
        System.out.println();
    }

    public List<String[]> getTableDataByFatorProducaoId(String tableName, int fatorProducaoId) {

        List<String[]> result = new ArrayList<>();

        try {
            String query = "SELECT * FROM " + tableName + " WHERE Fator_Producao_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, fatorProducaoId);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    ResultSetMetaData metaData = resultSet.getMetaData();
                    int columnCount = metaData.getColumnCount();

                    while (resultSet.next()) {
                        String[] row = new String[columnCount];
                        for (int i = 1; i <= columnCount; i++) {
                            row[i - 1] = resultSet.getString(i);
                        }
                        result.add(row);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public void printTableDataByFatorId(String tableName, List<String[]> data, int fatorProducaoId) {

        if (data.isEmpty()) {
            System.out.println("No data found in the table.");
            return;
        }

        String[] columnNames = new String[]{data.get(0)[0], data.get(0)[1]};
        printTableHeader(columnNames);

        for (String[] row : data) {

            int rowFatorProducaoId = Integer.parseInt(row[0]);

            if (rowFatorProducaoId == fatorProducaoId) {
                printTableLine(new String[]{row[0], row[1]});
            }
        }
    }

}


```

### register_moment.sql

```sql

CREATE OR REPLACE FUNCTION cancel_operation(p_operacao_id NUMBER)

    RETURN NUMBER IS returnValue NUMBER := 0;

    v_data_prevista DATE;
    v_data_atual DATE;

BEGIN
    -------------------------------------------------------------------------------------------------------------------

    --Verificar se operação pode ser anulada

SELECT data
INTO v_data_prevista
FROM OPERACAO_AGRICOLA
WHERE id = p_operacao_id;

v_data_atual := SYSDATE;

    IF v_data_atual > v_data_prevista + 3 THEN
        --ja se passaram mais de 3 dias desde a data prevista
        DBMS_OUTPUT.put_line('Já se passaram mais de 3 dias desde a data prevista. Não é possível anular a operação');
RETURN returnValue; -- falha na anulação da operação
END IF;

    -------------------------------------------------------------------------------------------------------------------

    -- Verificar operações dependentes

    --IF EXISTS(SELECT 1 FROM OPERACAO_AGRICOLA WHERE id_dependente = p_operacao_id) THEN
        --existem operações dependentes
        --DBMS_OUTPUT.put_line('Não é possível anular a operação. Existem operações dependentes');
        --RETURN returnValue; -- falha na anulação da operação
    --end if;

    -------------------------------------------------------------------------------------------------------------------

    -- Anula a operação

UPDATE OPERACAO_AGRICOLA SET validade = 0 WHERE id = p_operacao_id;

COMMIT;
RETURN 1; -- Operação Anulada com sucesso

-------------------------------------------------------------------------------------------------------------------

END;
/
```