# EDC and Tractus-X

1- A intro session on concepts, terminologies, architectures of EDC and Tractus-X.

-  For example, key vault integration and data storage.  

[Here](mailto:https://github.com/eclipse-edc/Connector/tree/main/extensions/common/vault/vault-hashicorp) you can find the required information to config the hashicorp . The confusion part is the way that you enter your credentials into the hashicorp I believe. There is an example in Example in this page (**Create & Configure an OAuth2 private key)** which you can follow the same approach for your own keys.

- Latest data exchange demo. ?

2- Best practices and quickstart manuals on setting up EDC, Tractus-X and samples.

[https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd](https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd)

[https://github.com/eclipse-edc/MinimumViableDataspace](https://github.com/eclipse-edc/MinimumViableDataspace)

3- Could EDC (and Tractus-X) run independently without Catena-X now? If no, how could we setup local trial environment?

                Yes, you just need to create your own launcher with Gradle. [https://github.com/eclipse-edc/MinimumViableDataspace](https://github.com/eclipse-edc/MinimumViableDataspace) is a good repository to follow and learn how to do that. You can follow the local deployment in the readme and deploy a dataspace in your local machine using docker. And also you can take a look into this launcher and see change the extensions based on your needs. [https://github.com/eclipse-edc/MinimumViableDataspace/tree/main/launchers/connector](https://github.com/eclipse-edc/MinimumViableDataspace/tree/main/launchers/connector)

4- Playground like existing data source that we can connect EDC with and exchange data?

[https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd](https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd)

[https://github.com/eclipse-edc/MinimumViableDataspace](https://github.com/eclipse-edc/MinimumViableDataspace)

- Catena-X

1.     Is there an environment that we could skip company onboarding process and try Catena-X components?

                              [https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd](https://github.com/eclipse-tractusx/tutorial-resources/tree/main/mxd)

2.     Best practices sharing on EDC(Tractus-X) communicating with Catena-X.

