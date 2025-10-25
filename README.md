# yaaic - ABAP AI tools Cloud - Usage Examples

This repository, **yaaic - ABAP AI tools Cloud - Usage Examples**, provides practical examples demonstrating the usage of the ABAP AI tools Cloud library (`yaai_cloud`). The code in this repository is entirely written in ABAP.

## 🔗 The Core Library: ABAP AI tools Cloud (`yaai_cloud`)

The examples in this repository are based on the **ABAP AI tools Cloud** library (`yaai_cloud`), which provides a set of tools designed to facilitate **Artificial Intelligence capabilities within ABAP Cloud environments**.

The library is experimental and released under the MIT License, meaning users utilize the tools at their own risk.

### Key Features of ABAP AI tools Cloud

The ABAP AI tools Cloud library offers advanced functionalities to build intelligent ABAP applications:

*   **Multi-Provider LLM API Support:** It supports seamless integration with multiple large language model (LLM) APIs, providing flexibility in choosing providers and deployment models. Currently supported APIs include **OpenAI**, **Google Gemini**, and **Anthropic**. APIs from other providers, such as **Mistral** (cloud-based), that implement the OpenAI API standards, may also work, potentially requiring minor adjustments.
*   **Conversation Management:** It allows users to maintain and manage multi-turn conversations, providing full access to conversation history for advanced chat scenarios.
*   **Tool/Function Calling:** ABAP business logic can be integrated with LLMs using function/tool calling, enabling AI models to trigger ABAP methods.
*   **Retrieval-Augmented Generation (RAG):** This feature enhances LLM outputs by incorporating enterprise data, leading to more accurate and relevant answers through RAG workflows.

### Prerequisites for ABAP AI tools Cloud

To run the examples that utilize the `yaai_cloud` library, the following prerequisites are necessary:

*   **SAP ABAP Cloud:** You must have an **SAP BTP ABAP environment** or an **SAP S/4HANA Cloud ABAP environment** (also known as Embedded Steampunk).
*   **abapGit:** The `abapGit Repositories Eclipse ADT Plug-In` must be installed.