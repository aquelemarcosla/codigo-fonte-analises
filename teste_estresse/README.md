# 📚 Guia Completo: Análise de Otimizações de Compilador

Este conjunto de documentos foi criado para te ensinar, de forma **didática e prática**, como identificar as diferenças entre os níveis de otimização -O0, -O1, -O2 e -O3 do compilador.

---

## 🗺️ Roteiro de Estudo Recomendado

### **1️⃣ COMECE AQUI** (10 minutos)
📄 **[ANALISE_RESULTADOS.md](ANALISE_RESULTADOS.md)**
- ✅ Análise automática dos SEUS arquivos
- ✅ Tabela comparativa visual
- ✅ Conclusões práticas
- ✅ Teste rápido (30 segundos)

**Por que começar aqui?** Você vê os resultados práticos do SEU código antes de mergulhar na teoria.

---

### **2️⃣ ENTENDA A TEORIA** (30 minutos)
📄 **[GUIA_OTIMIZACOES.md](../GUIA_OTIMIZACOES.md)**
- 📖 Visão geral de cada nível (-O0 a -O3)
- 🔍 4 métodos rápidos de identificação
- 📖 Glossário completo de instruções ARM64
- 💡 Padrões de código assembly
- 🎯 Exemplo prático passo a passo

**Por que ler?** Fundamentação teórica sólida para entender o "porquê" das diferenças.

---

### **3️⃣ EXEMPLOS PRÁTICOS** (20 minutos)
📄 **[EXEMPLOS_LADO_A_LADO.md](EXEMPLOS_LADO_A_LADO.md)**
- 🔬 Mesmo código C em 4 níveis diferentes
- ➡️ Comparação linha por linha
- 📊 Análise detalhada de cada transformação
- 💡 Como reconhecer visualmente

**Por que ler?** Você vê EXATAMENTE o que muda de um nível para outro.

---

### **4️⃣ REFERÊNCIA RÁPIDA** (Use quando precisar)
📄 **[CHECKLIST_IDENTIFICACAO.md](CHECKLIST_IDENTIFICACAO.md)**
- ✅ Checklist completa para cada nível
- 🚀 Método relâmpago (30 segundos)
- 📊 Tabela de decisão rápida
- 🔧 Comandos úteis para análise
- 🎓 Dicas para TCC/IC

**Por que ter?** Consulta rápida quando estiver analisando novos códigos.

---

## 🛠️ Ferramentas Disponíveis

### **Script Python** (Análise Automática)
```bash
python analise_otimizacoes.py
```

**O que faz:**
- Analisa todos os arquivos `estresse_O*.s`
- Detecta automaticamente o nível de otimização
- Mostra métricas: linhas, stack, vetorização, registradores
- Gera tabela comparativa

**Requisitos:** Python 3.x (sem dependências extras)

---

### **Script PowerShell** (Análise Automática)
```powershell
.\analise_otimizacoes.ps1
```

**O que faz:** Mesma funcionalidade do script Python, mas para Windows PowerShell.

---

## 📂 Arquivos do Projeto

```
teste_estresse/
├── codigo_estresse.c          # Código fonte C
├── estresse_O0.s              # Assembly -O0 (207 linhas)
├── estresse_O1.s              # Assembly -O1 (127 linhas)
├── estresse_O2.s              # Assembly -O2 (172 linhas)
├── estresse_O3.s              # Assembly -O3 (172 linhas)
├── estresse_O0.ll             # LLVM IR -O0
├── estresse_O1.ll             # LLVM IR -O1
├── estresse_O2.ll             # LLVM IR -O2
├── estresse_O3.ll             # LLVM IR -O3
├── estresse_O0                # Binário -O0
├── estresse_O1                # Binário -O1
├── estresse_O2                # Binário -O2
├── estresse_O3                # Binário -O3
├── analise_otimizacoes.py     # Script de análise (Python)
├── analise_otimizacoes.ps1    # Script de análise (PowerShell)
├── README.md                  # Este arquivo
├── ANALISE_RESULTADOS.md      # ⭐ Resultados da sua análise
├── EXEMPLOS_LADO_A_LADO.md    # 🔬 Comparação detalhada
└── CHECKLIST_IDENTIFICACAO.md # ✅ Referência rápida

../
└── GUIA_OTIMIZACOES.md        # 📖 Guia teórico completo
```

---

## 🎯 Resumo Executivo (TL;DR)

### **Como Identificar Rapidamente:**

| Se você vê... | Então é... |
|---------------|------------|
| `sub sp, sp, #112` (stack grande) | **-O0** |
| Muitos `ldur`/`stur` (>30) | **-O0** |
| Stack pequeno (~48B) + SEM `z` registers | **-O1** |
| `rdvl`, `ptrue`, `z0-z31`, `st1d` | **-O2/-O3** |

### **Diferenças Principais:**

| Nível | Linhas | Stack | Vetorizado | Velocidade |
|-------|--------|-------|------------|------------|
| -O0 | 207 | 112B | ❌ | 1.0x |
| -O1 | 127 | 48B | ❌ | ~3x |
| -O2 | 172 | 48B | ✅ | ~8x |
| -O3 | 172 | 48B | ✅ | ~8x |

### **Principais Transformações:**

**O0 → O1:**
- ✅ Variáveis da stack → registradores
- ✅ Loops fundidos
- ✅ Stack reduzida (-57%)
- ✅ Código 39% menor

**O1 → O2:**
- ✅ Vetorização (SVE)
- ✅ Processa 2-8 elementos por vez
- ✅ Código cresce (+35%) mas é ~2.5x mais rápido

**O2 → O3:**
- No SEU código: **idênticos**
- Em geral: mais loop unrolling, inlining

---

## 🚀 Quick Start (5 minutos)

1. **Leia** `ANALISE_RESULTADOS.md` (resultados prontos)
2. **Execute** `python analise_otimizacoes.py` (veja a mágica)
3. **Compare** abra `estresse_O0.s` e `estresse_O1.s` lado a lado
4. **Procure** por `rdvl` em `estresse_O2.s` (vetorização!)

---

## 🎓 Para Seu TCC/IC

### **Seções Sugeridas:**

1. **Metodologia**
   - Compilador usado: `clang 18.1.3`
   - Flags: `-O0`, `-O1`, `-O2`, `-O3`, `-S`
   - Arquitetura: ARM64 (AArch64)
   - Código de teste: multiplicação de matrizes 2000×2000

2. **Métricas**
   - Use a tabela de `ANALISE_RESULTADOS.md`
   - Compare: linhas, stack, acessos à memória, vetorização

3. **Análise Qualitativa**
   - Use exemplos de `EXEMPLOS_LADO_A_LADO.md`
   - Explique: loop fusion, register allocation, vectorization

4. **Conclusões**
   - -O1: melhor custo-benefício (3x mais rápido, compila rápido)
   - -O2/-O3: máxima performance (8x mais rápido, vetorizado)
   - Trade-off: tamanho vs velocidade vs tempo de compilação

### **Figuras/Gráficos Sugeridos:**

- [ ] Gráfico de barras: Linhas de assembly por nível
- [ ] Gráfico de pizza: Distribuição de tipos de instrução
- [ ] Tabela: Métricas comparativas (já pronta em ANALISE_RESULTADOS.md)
- [ ] Snippet de código: Antes e depois (use EXEMPLOS_LADO_A_LADO.md)
- [ ] Gráfico de linha: Tempo de execução vs nível

---

## 🔧 Comandos Úteis

### **Comparar dois níveis:**
```bash
diff -u estresse_O0.s estresse_O1.s | less
```

### **Contar instruções:**
```bash
wc -l estresse_O*.s
```

### **Buscar vetorização:**
```bash
grep -n "rdvl\|ptrue\|z[0-9]" estresse_O2.s
```

### **Análise completa:**
```bash
python analise_otimizacoes.py > relatorio.txt
```

---

## 📚 Referências

- **ARM Architecture**: https://developer.arm.com/documentation/
- **LLVM Optimization**: https://llvm.org/docs/Passes.html
- **Compiler Explorer**: https://godbolt.org/ (visualize online!)
- **GCC Optimization Flags**: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html

---

## 💡 Dicas Finais

1. **Sempre compile com mesmas flags** exceto -OX
2. **Use Compiler Explorer (Godbolt)** para visualizar em cores
3. **Comece do simples**: analise loops pequenos primeiro
4. **Não decore**: entenda os padrões (stack, registradores, vetorização)
5. **Practice**: compile seus próprios códigos com diferentes níveis

---

## ❓ FAQ

**Q: Por que O2 e O3 são idênticos?**
A: Neste código específico, O2 já aplicou todas otimizações possíveis. O3 adiciona otimizações que só fazem diferença em códigos mais complexos (múltiplas funções, loops maiores, etc.)

**Q: O que significa "vetorização"?**
A: Processar múltiplos dados com uma única instrução (SIMD). Em vez de `temp = a + b`, faz `[t1,t2,t3,t4] = [a1,a2,a3,a4] + [b1,b2,b3,b4]`

**Q: Por que O2 tem MAIS linhas que O1?**
A: Vetorização adiciona código de setup (detectar tamanho do vetor, criar máscaras) e cleanup (processar elementos restantes). Mas cada iteração processa 2-8x mais dados!

**Q: Qual usar em produção?**
A: Geralmente -O2. É balanceado e seguro. -O3 pode causar problemas (precisão floating-point, tamanho do binário).

---

**Criado para análise de otimizações de compilador - Projeto IC**
**Documentação completa e prática! 🎉**

Se tiver dúvidas, consulte os arquivos específicos ou os comentários no código assembly.
