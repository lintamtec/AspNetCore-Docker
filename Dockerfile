FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM mcr.microsoft.com/dotnet/aspnet:3.1
COPY --from=build-env /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspCoreOnDocker.dll"]

