public class Endereco_Pessoa extends Pessoa {
  private int id_endereco;
  private String rua;
  private String numero;
  private String bairro;
  private String cidade;
  private String CEP;
  private String UF;

  public Endereco_Pessoa() {
    super();
  }

  public int getId_endereco() {
    return id_endereco;
  }

  public String getRua() {
    return rua;
  }
  public void setRua(String rua) {
    this.rua = rua;
  }

  public String getNumero() {
    return numero;
  }
  public void setNumero(String numero) {
    this.numero = numero;
  }

  public String getBairro() {
    return bairro;
  }
  public void setBairro(String bairro) {
    this.bairro = bairro;
  }

  public String getCidade() {
    return cidade;
  }
  public void setCidade(String cidade) {
    this.cidade = cidade;
  }

  public String getCEP() {
    return CEP;
  }
  public void setCEP(String CEP) {
    this.CEP = CEP;
  }

  public String getUF() {
    return UF;
  }
  public void setUF(String UF) {
    this.UF = UF;
  }
}
