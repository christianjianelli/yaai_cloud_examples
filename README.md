[![License](https://img.shields.io/github/license/christianjianelli/yaai_cloud?label=License&color=success)](https://github.com/christianjianelli/yaai_cloud/blob/main/LICENSE)

# ABAP AI tools Cloud - Usage Examples

This repository provides practical examples demonstrating how to use the **ABAP AI tools Cloud** library ([`yaai_cloud`](https://github.com/christianjianelli/yaai_cloud)).

## Core Library: ABAP AI tools Cloud

The examples are based on the **ABAP AI tools Cloud** library, which enables **Artificial Intelligence capabilities in ABAP Cloud environments**.

> **Note:** The library is released under the MIT License.
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

## Examples

The `src/` folder contains ABAP classes demonstrating various features of the `yaai_cloud` library. Below is a list of the example classes, categorized by functionality:

### Basic Usage Examples

These examples show how to integrate with different AI providers for basic text generation and conversation:

- `ZCL_AAIC_EXAMPLE_ANTHROPIC` - Basic usage with Anthropic Claude
- `ZCL_AAIC_EXAMPLE_GOOGLE` - Basic usage with Google Gemini
- `ZCL_AAIC_EXAMPLE_MISTRAL` - Basic usage with Mistral AI
- `ZCL_AAIC_EXAMPLE_OPENAI` - Basic usage with OpenAI

### Function Calling Examples

Examples demonstrating tool/function calling capabilities, allowing AI models to invoke ABAP methods:

- `ZCL_AAIC_EXAMPLE_FC_ANTHROPIC` - Function calling with Anthropic Claude
- `ZCL_AAIC_EXAMPLE_FC_GOOGLE` - Function calling with Google Gemini
- `ZCL_AAIC_EXAMPLE_FC_OPENAI` - Function calling with OpenAI models
- `ZCL_AAIC_EXAMPLE_FCPRX_OPENAI` - Function calling proxy example with OpenAI

### Integration Suite Examples

Examples for SAP Integration Suite integrations:

- `ZCL_AAIC_EXAMPLE_ISUITE_GOOGLE` - Integration Suite example with Google Gemini
- `ZCL_AAIC_EXAMPLE_ISUITE_NVIDIA` - Integration Suite example with NVIDIA models
- `ZCL_AAIC_EXAMPLE_ISUITE_OPENAI` - Integration Suite example with OpenAI
- `ZCL_AAIC_EXPL_ISUITE_ANTHROPIC` - Integration Suite example with Anthropic
- `ZCL_AAIC_EXPL_ISUITE_MISTRAL` - Integration Suite example with Mistral

### Other Examples

Additional examples showcasing specific features:

- `ZCL_AAIC_EXAMPLE_OPENAI_AGENT` - OpenAI agent implementation
- `ZCL_AAIC_EXAMPLE_PROMPT_TEMPL` - Prompt template example
- `ZCL_AAIC_EXAMPLE_SI_ANTHROPIC` - System Instructions example with Anthropic
- `ZCL_AAIC_EXAMPLE_SI_GOOGLE` - System Instructions example with Google Gemini
- `ZCL_AAIC_EXAMPLE_SI_OPENAI` - System Instructions example with OpenAI
- `ZCL_AAIC_MATH_TOOLS` - Math tools implementation
- `ZCL_AAIC_MATH_TOOLS_PROXY` - Math tools proxy example
