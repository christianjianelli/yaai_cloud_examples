# yaaic - ABAP AI tools Cloud - Usage Examples

This repository provides practical examples demonstrating how to use the **ABAP AI tools Cloud** library ([`yaai_cloud`](https://github.com/christianjianelli/yaai_cloud)). All code is written in ABAP.

## 🔗 Core Library: ABAP AI tools Cloud ([`yaai_cloud`](https://github.com/christianjianelli/yaai_cloud))

The examples are based on the experimental **ABAP AI tools Cloud** library, which enables **Artificial Intelligence capabilities in ABAP Cloud environments**.

> **Note:** The library is experimental and released under the MIT License. Use at your own risk.
>
> **Repository:** [https://github.com/christianjianelli/yaai_cloud](https://github.com/christianjianelli/yaai_cloud)

### Key Features

The ABAP AI tools Cloud library offers advanced features for building intelligent ABAP applications:

- **Multi-Provider LLM API Support:** Integrate with multiple large language model (LLM) APIs, including **OpenAI**, **Google Gemini**, and **Anthropic**. Other providers (e.g., **Mistral**) that implement OpenAI API standards may also work with minor adjustments.
- **Conversation Management:** Maintain and manage multi-turn conversations, with full access to conversation history for advanced chat scenarios.
- **Tool/Function Calling:** Integrate ABAP business logic with LLMs using function/tool calling, allowing AI models to trigger ABAP methods.
- **Retrieval-Augmented Generation (RAG):** Enhance LLM outputs by incorporating enterprise data, enabling more accurate and relevant answers through RAG workflows.

### Prerequisites

To run the examples using the `yaai_cloud` library, you need:

- **SAP ABAP Cloud:** An **SAP BTP ABAP environment** or **SAP S/4HANA Cloud ABAP environment** (Embedded Steampunk).
- **abapGit:** The `abapGit Repositories Eclipse ADT Plug-In` must be installed.