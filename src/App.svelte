<script>
    import Fa from 'svelte-fa'
    import { faDesktop, faAddressCard } from '@fortawesome/free-solid-svg-icons'
    import { Router, Route, navigate } from "svelte-routing";
    import { Navbar, NavbarBrand, Nav, NavItem, NavLink, Container, Row, ListGroup, ListGroupItem } from "sveltestrap";

    import NavigationItem from "./component/NavigationItem.svelte";
    import Computers from "./computer/Computers.svelte";
    import ComputerCreate from "./computer/ComputerCreate.svelte";
    import ComputerDetail from "./computer/ComputerDetail.svelte";
    import Addresses from "./address/Addresses.svelte";
    import AddressCreate from "./address/AddressCreate.svelte";
    import AddressDetail from "./address/AddressDetail.svelte";

    export let url = "";
</script>

<svelte:head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
</svelte:head>

<Navbar class="navbar-dark bg-dark p-0">
    <NavbarBrand on:click={() => navigate("/")}>Evidence</NavbarBrand>
    <Nav navbar>XXX</Nav>
</Navbar>

<Container fluid>
    <Row>
        <Navbar class="col-md-2 d-md-block bg-light sidebar" container=''>
            <Nav class="flex-column">
                <NavigationItem to="/computers">
                    <Fa icon={faDesktop} class="nav-icon" />
                    Computers
                </NavigationItem>
                <NavigationItem to="/addresses">
                    <Fa icon={faAddressCard} class="nav-icon" />
                    Addresses
                </NavigationItem>
            </Nav>
        </Navbar>
        <main role="main" class="col-md-10 mt-4 mb-4">
            <Container>
                <Router {url}>
                    <Route path="/">Home page</Route>
                    <Route path="/computers"><Computers/></Route>
                    <Route path="/computers/:id" let:params><ComputerDetail id="{params.id}"/></Route>
                    <Route path="/computers/new"><ComputerCreate/></Route>
                    <Route path="/addresses"><Addresses/></Route>
                    <Route path="/addresses/:id" let:params><AddressDetail id="{params.id}"/></Route>
                    <Route path="/addresses/new"><AddressCreate/></Route>
                </Router>
            </Container>
        </main>
    </Row>
</Container>
